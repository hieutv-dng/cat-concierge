/*
 * File: camera_view.dart
 * File Created: Wednesday, 26th April 2023 10:31:56 am
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 26th April 2023 11:34:50 pm
 * Modified By: Dương Trí
 */

import 'package:camera/camera.dart';
import 'package:cat_concierge/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:one/one.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.customPaint,
    required this.onImage,
    required this.onTakePicture,
    this.initialDirection = CameraLensDirection.back,
  }) : super(key: key);

  final CustomPaint? customPaint;
  final void Function(InputImage inputImage) onImage;
  final void Function(XFile file) onTakePicture;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  int _cameraIndex = -1;

  @override
  void initState() {
    super.initState();
    if (cameras.any(
      (element) => element.lensDirection == widget.initialDirection && element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) => element.lensDirection == widget.initialDirection && element.sensorOrientation == 90),
      );
    } else {
      for (var i = 0; i < cameras.length; i++) {
        if (cameras[i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
      }
    }

    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    final body = _liveFeedBody(context);
    return body;
  }

  Widget _liveFeedBody(BuildContext context) {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
          Positioned.fill(child: _floatingActionButton(context)),
        ],
      ),
    );
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    if (_controller!.value.isStreamingImages) {
      await _controller?.stopImageStream();
    }
    await _controller?.dispose();
    _controller = null;
  }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    // print('SIZE camera: ${imageSize.width}
    final camera = cameras[_cameraIndex];
    final imageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;
    final inputImageFormat = InputImageFormatValue.fromRawValue(int.parse(image.format.raw.toString()));
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        // print('SIZE plane: ${plane.width}:${plane.
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();
    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );
    final inputImage = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }

  Widget _floatingActionButton(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: bottom, top: theme.spacing.small),
          child: ElevatedButton(
            onPressed: () async {
              if (_controller?.value.isInitialized == true) {
                EasyLoading.show();
                _controller?.stopImageStream();
                final fileImage = await _controller!.takePicture();
                widget.onTakePicture(fileImage);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: theme.primaryColor, width: theme.spacing.small * .5)),
              padding: EdgeInsets.all(theme.spacing.small * .5),
              backgroundColor: Colors.white,
              elevation: 5,
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
              ),
              margin: EdgeInsets.all(theme.spacing.small * .5),
            ),
          ),
        ),
      ],
    );
  }
}
