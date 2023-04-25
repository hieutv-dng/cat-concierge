import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../core/index.dart';
import '../../main.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.customPaint,
    required this.onImage,
    this.initialDirection = CameraLensDirection.back,
    required this.onTakePicture,
  }) : super(key: key);

  final CustomPaint? customPaint;
  // ignore: inference_failure_on_function_return_type
  final Function(InputImage inputImage) onImage;
  // ignore: inference_failure_on_function_return_type
  final Function(XFile file) onTakePicture;
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
    return _body();
  }

  Widget _body() {
    final body = _liveFeedBody();
    return body;
  }

  Widget _liveFeedBody() {
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
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
          Align(
            alignment: Alignment.bottomCenter,
            child: _floatingActionButton(),
          ),
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
    await _controller?.stopImageStream();
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
    // print('SIZE camera: ${imageSize.width} : ${imageSize.height}');
    final camera = cameras[_cameraIndex];
    final imageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;
    final inputImageFormat = InputImageFormatValue.fromRawValue(int.parse(image.format.raw.toString()));
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        // print('SIZE plane: ${plane.width}:${plane.height}');
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

  Widget _floatingActionButton() {
    return Container(
      height: 110,
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            if (_controller?.value.isInitialized == true) {
              final fileImage = await _controller!.takePicture();
              widget.onTakePicture(fileImage);
            }
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SvgPicture.asset(
              MySvgs.ic_button_capture,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
