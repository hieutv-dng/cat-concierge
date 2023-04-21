import 'dart:math';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'mlkit_utils.dart';
import 'painters/barcode_focus_area_painter.dart';
import 'painters/coordinates_translator.dart';

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

  final _barcodeInArea = ValueNotifier<bool>(false);

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
    final size = widget.previewRect.width * 1.4;
    // previewSize is the preview as seen by the camera but it might
    // not fulfill the current aspectRatio.
    // previewRect on the other hand is the preview as seen by the user,
    // including the clipping that may be needed to respect the current
    // aspectRatio.
    _scanArea = Rect.fromCenter(
      center: widget.previewRect.center,
      // In this example, we want the barcode scan area to be a fraction
      // of the preview that is seen by the user, so we use previewRect
      width: size * .5,
      height: size,
    );

    _scanAreaResult = Rect.fromLTWH(
      _scanArea.left,
      _scanArea.top,
      size / 6,
      size / 8,
    );

    _scanAreaBLD = Rect.fromLTWH(
      _scanArea.left,
      _scanArea.bottom - size / 8,
      size / 6,
      size / 8,
    );

    _scanAreaGLU = Rect.fromLTWH(
      _scanArea.right - size / 6,
      _scanArea.bottom - size / 8,
      size / 6,
      size / 8,
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
              valueListenable: _barcodeInArea,
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
                valueListenable: _barcodeInArea,
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
      _barcodeInArea.value = false;
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

      if (rects.length == 3) {
        final containsResult = _scanAreaResult.contains(rects['Result card']!.topLeft);
        final containsBLD = _scanAreaBLD.contains(rects['BLD']!.bottomLeft);
        final containsGLU = _scanAreaGLU.contains(rects['GLU']!.bottomRight);
        _barcodeInArea.value = containsResult && containsGLU && containsBLD;
      } else {
        _barcodeInArea.value = false;
      }
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }
}
