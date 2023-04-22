import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:cat_concierge/components/camera_scan/widgets/mlkit_utils.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:tuple/tuple.dart';

import 'painters/barcode_focus_area_painter.dart';
import 'painters/coordinates_translator.dart';
import 'painters/text_detector_painter.dart';

class KitPreviewOverlay extends StatefulWidget {
  final CameraState state;
  final PreviewSize previewSize;
  final Rect previewRect;
  // final List<Barcode> barcodes;
  final RecognizedText recognizedText;
  final AnalysisImage? analysisImage;
  final bool isDetectBarcodeInArea;
  final bool isBackCamera;
  final bool isDrawBarcodeTracking;

  const KitPreviewOverlay({
    super.key,
    required this.state,
    required this.previewSize,
    required this.previewRect,
    required this.recognizedText,
    // required this.barcodes,
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
  late Rect _scanAreaResult;
  late Rect _scanAreaBLD;
  late Rect _scanAreaGLU;

  final _checkInArea = ValueNotifier<bool>(false);
  final _resulrInArea = ValueNotifier<bool>(false);
  final _BLDInArea = ValueNotifier<bool>(false);
  final _GLUInArea = ValueNotifier<bool>(false);

  final _imageAndText = ValueNotifier<Tuple2<AnalysisImage?, RecognizedText?>>(const Tuple2(null, null));

  @override
  void initState() {
    _refreshScanArea();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant KitPreviewOverlay oldWidget) {
    if (widget.recognizedText != oldWidget.recognizedText || widget.analysisImage != oldWidget.analysisImage && widget.analysisImage != null) {
      _refreshScanArea();
      _detectBarcodesInArea(widget.analysisImage!, widget.recognizedText);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _refreshScanArea() {
    final sizeWidth = widget.previewRect.width * .7;
    final sizeHeight = widget.previewRect.height * .75;
    // previewSize is the preview as seen by the camera but it might
    // not fulfill the current aspectRatio.
    // previewRect on the other hand is the preview as seen by the user,
    // including the clipping that may be needed to respect the current
    // aspectRatio.
    _scanArea = Rect.fromCenter(
      center: widget.previewRect.center,
      // In this example, we want the barcode scan area to be a fraction
      // of the preview that is seen by the user, so we use previewRect
      width: sizeWidth,
      height: sizeHeight,
    );

    _scanAreaResult = Rect.fromLTWH(
      _scanArea.left,
      _scanArea.top,
      sizeWidth / 2,
      sizeHeight / 6,
    );

    _scanAreaBLD = Rect.fromLTWH(
      _scanArea.left,
      _scanArea.bottom - sizeHeight / 6,
      sizeWidth / 2,
      sizeHeight / 6,
    );

    _scanAreaGLU = Rect.fromLTWH(
      _scanArea.right - sizeWidth / 2,
      _scanArea.bottom - sizeHeight / 6,
      sizeWidth / 2,
      sizeHeight / 6,
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
        ),
        child: Stack(children: [
          Positioned.fill(
            child: ValueListenableBuilder(
              valueListenable: _checkInArea,
              builder: (context, inArea, child) {
                return CustomPaint(
                  painter: BarcodeFocusAreaPainter(
                    scanArea: _scanArea.size,
                    color: inArea ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: _scanArea.width,
              height: _scanArea.height,
              child: ValueListenableBuilder<bool>(
                valueListenable: _checkInArea,
                builder: (context, inArea, child) {
                  return SvgPicture.asset(
                    MySvgs.kit_mask,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: _scanAreaResult.top,
            left: _scanAreaResult.left,
            width: _scanAreaResult.width,
            height: _scanAreaResult.height,
            child: ValueListenableBuilder(
              valueListenable: _resulrInArea,
              builder: (context, inArea, child) {
                return SvgPicture.asset(
                  MySvgs.kit_box,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                );
              },
            ),
          ),
          Positioned(
            top: _scanAreaBLD.top,
            left: _scanAreaBLD.left,
            width: _scanAreaBLD.width,
            height: _scanAreaBLD.height,
            child: ValueListenableBuilder(
              valueListenable: _BLDInArea,
              builder: (context, inArea, child) {
                return SvgPicture.asset(
                  MySvgs.kit_box,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                );
              },
            ),
          ),
          Positioned(
            top: _scanAreaGLU.top,
            left: _scanAreaGLU.left,
            width: _scanAreaGLU.width,
            height: _scanAreaGLU.height,
            child: ValueListenableBuilder(
              valueListenable: _GLUInArea,
              builder: (context, inArea, child) {
                return SvgPicture.asset(
                  MySvgs.kit_box,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                );
              },
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
  Future _detectBarcodesInArea(AnalysisImage img, RecognizedText recognizedText) async {
    final Size imageSize = img.size;
    final croppedSize = img.croppedSize;
    final ratioAnalysisToPreview = widget.previewSize.width / croppedSize.width;

    try {
      final rects = <String, Rect>{};
      _checkInArea.value = false;
      for (final barcode in recognizedText.blocks
          .where((e) => e.text.isNotEmpty)
          .where((e) => e.text.trim().contains('Result card') || e.text.trim().contains('BLD') || e.text.trim().contains('GLU'))) {
        final topLeft = croppedPosition(
          barcode.cornerPoints[0],
          analysisImageSize: imageSize,
          croppedSize: croppedSize,
          screenSize: _screenSize,
          ratio: ratioAnalysisToPreview,
          flipXY: false,
        ).translate(-widget.previewRect.left, -widget.previewRect.top);
        final bottomRight = croppedPosition(
          barcode.cornerPoints[2],
          analysisImageSize: imageSize,
          croppedSize: croppedSize,
          screenSize: _screenSize,
          ratio: ratioAnalysisToPreview,
          flipXY: false,
        ).translate(-widget.previewRect.left, -widget.previewRect.top);
        rects[barcode.text.trim()] = Rect.fromLTRB(topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
      }

      if (rects.length > 0) {
        final a = _scanAreaResult.contains(rects['Result card']!.topLeft);
        final b = _scanAreaBLD.contains(rects['BLD']!.bottomLeft);
        final c = _scanAreaGLU.contains(rects['GLU']!.bottomRight);
        // _resulrInArea.value = _scanAreaResult.contains(rects['Result card']!.topLeft);

        _checkInArea.value = a && b && c; //&& containsGLU && containsBLD;
      } else {
        // _resulrInArea.value = false;
        _checkInArea.value = false;
      }
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }
}
