import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import 'mlkit_utils.dart';
import 'painters/barcode_detector_painter.dart';
import 'painters/barcode_focus_area_painter.dart';
import 'painters/coordinates_translator.dart';

class KitPreviewOverlay extends StatefulWidget {
  final CameraState state;
  final PreviewSize previewSize;
  final Rect previewRect;
  final List<Barcode> barcodes;
  final AnalysisImage? analysisImage;
  final bool isDetectBarcodeInArea;
  final bool isBackCamera;
  final bool isDrawBarcodeTracking;

  const KitPreviewOverlay({
    super.key,
    required this.state,
    required this.previewSize,
    required this.previewRect,
    required this.barcodes,
    required this.analysisImage,
    this.isDetectBarcodeInArea = true,
    this.isBackCamera = true,
    this.isDrawBarcodeTracking = false,
  });

  @override
  State<KitPreviewOverlay> createState() => _KitPreviewOverlayState();
}

class _KitPreviewOverlayState extends State<KitPreviewOverlay> {
  late Size _screenSize;
  late Rect _scanArea;

  final _maskColor = ValueNotifier<Color>(Colors.blue);
  final _barcodeInArea = ValueNotifier<bool>(false);

  bool get _isDrawBarcodeTracking {
    return widget.isDrawBarcodeTracking &&
        widget.analysisImage != null &&
        (widget.analysisImage?.size != null &&
            widget.analysisImage?.inputImageRotation == InputImageRotation.rotation90deg);
  }

  @override
  void initState() {
    _refreshScanArea();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant KitPreviewOverlay oldWidget) {
    if (widget.barcodes != oldWidget.barcodes ||
        widget.analysisImage != oldWidget.analysisImage && widget.analysisImage != null) {
      _refreshScanArea();
      _detectBarcodesInArea(widget.analysisImage!, widget.barcodes);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _refreshScanArea() {
    // previewSize is the preview as seen by the camera but it might
    // not fulfill the current aspectRatio.
    // previewRect on the other hand is the preview as seen by the user,
    // including the clipping that may be needed to respect the current
    // aspectRatio.
    _scanArea = Rect.fromCenter(
      center: widget.previewRect.center,
      // In this example, we want the barcode scan area to be a fraction
      // of the preview that is seen by the user, so we use previewRect
      width: widget.previewRect.width * 1.4 * .5,
      height: widget.previewRect.width * 1.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return IgnorePointer(
      ignoring: true,
      child: Padding(
        // Area within this padding is our Preview
        padding: EdgeInsets.only(
          // top: widget.previewRect.top,
          left: widget.previewRect.left,
          right: _screenSize.width - widget.previewRect.right,
          // bottom: _screenSize.height - widget.previewRect.bottom,
        ),
        child: Stack(children: [
          if (_isDrawBarcodeTracking)
            Positioned.fill(
              child: CustomPaint(
                painter: BarcodeDetectorPainter(
                  widget.barcodes,
                  widget.analysisImage!.size,
                  widget.analysisImage!.inputImageRotation,
                ),
              ),
            ),
          Positioned.fill(
            child: ValueListenableBuilder(
              valueListenable: _barcodeInArea,
              builder: (context, inArea, child) {
                return CustomPaint(
                  painter: BarcodeFocusAreaPainter(
                    scanArea: _scanArea.size,
                    color: inArea ? Colors.green : Colors.blue,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: _scanArea.width,
              height: _scanArea.height,
              padding: const EdgeInsets.all(16.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: _barcodeInArea,
                builder: (context, inArea, child) {
                  return SvgPicture.asset(
                    'assets/layer_mask.svg',
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.blue, BlendMode.srcIn),
                  );
                },
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Scan the previously made\nhome test',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  /// Detects if one of the [barcodes] is in the [_scanArea] and updates UI
  /// accordingly.
  Future _detectBarcodesInArea(AnalysisImage img, List<Barcode> barcodes) async {
    final Size imageSize = img.size;
    final croppedSize = img.croppedSize;
    final ratioAnalysisToPreview = widget.previewSize.width / croppedSize.width;
    try {
      final rects = <Rect>[];
      _barcodeInArea.value = false;
      // debugPrint(barcodes.map((e) => e.displayValue ?? '').join(','));
      for (final barcode in barcodes.where((e) => e.displayValue == 'CCTR' || e.displayValue == 'CCBL')) {
        // Check if the barcode is within bounds
        if (barcode.cornerPoints != null) {
          final topLeft = croppedPosition(
            barcode.cornerPoints![0],
            analysisImageSize: imageSize,
            croppedSize: croppedSize,
            screenSize: _screenSize,
            ratio: ratioAnalysisToPreview,
            flipXY: false,
          ).translate(-widget.previewRect.left, -widget.previewRect.top);
          final bottomRight = croppedPosition(
            barcode.cornerPoints![2],
            analysisImageSize: imageSize,
            croppedSize: croppedSize,
            screenSize: _screenSize,
            ratio: ratioAnalysisToPreview,
            flipXY: false,
          ).translate(-widget.previewRect.left, -widget.previewRect.top);
          rects.add(Rect.fromLTRB(topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy));
        }
      }

      if (rects.length == 2) {
        _barcodeInArea.value = rects.every((e) => _scanArea.contains(
              e.center,
            ));
      } else {
        _barcodeInArea.value = false;
      }
      // Approximately detect if the barcode is in the scan area by checking
      // if the center of the barcode is in the scan area.
      // if (_scanArea.contains(
      //   barcodeRect.center.translate(
      //     (_screenSize.width - widget.previewSize.width) / 2,
      //     (_screenSize.height - widget.previewSize.height) / 2,
      //   ),
      // )) {
      //   _barcodeInArea.value = true;
      //   // Only handle one good barcode in this example
      //   break;
      // } else {
      //   _barcodeInArea.value = false;
      // }
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }
}
