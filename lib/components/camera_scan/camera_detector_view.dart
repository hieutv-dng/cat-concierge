import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;

import 'camera_view.dart';
import 'widgets/painters/coordinates_translator.dart';
import 'widgets/painters/text_detector_painter.dart';

class CameraRecognizerView extends StatefulWidget {
  const CameraRecognizerView({super.key});

  @override
  State<CameraRecognizerView> createState() => _CameraRecognizerViewState();
}

class _CameraRecognizerViewState extends State<CameraRecognizerView> {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  final _kitMask = 'assets/svgs/kit_mask.svg';
  final _checkInArea = ValueNotifier<bool>(false);
  Rect sizeKit = Rect.zero;
  Rect _scanArea = Rect.zero;
  Rect _scanAreaResult = Rect.zero;
  Rect _scanAreaBLD = Rect.zero;
  Rect _scanAreaGLU = Rect.zero;
  final rectTexts = <String, Rect>{};
  Size _sizeCamera = const Size(0, 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    // var scale = size.aspectRatio * _controller!.value.aspectRatio;
    // final sizeKit = Size((_controller!.value.previewSize!.height / 16 * 9) * .6, _controller!.value.previewSize!.height * .6);
    if (sizeCamera != _sizeCamera) {
      _sizeCamera = sizeCamera;
      sizeKit = Rect.fromCenter(
        center: Offset(sizeCamera.width / 2, sizeCamera.height / 2),
        width: sizeCamera.width * 0.7,
        height: sizeCamera.height * 0.65,
      );

      _scanArea = Rect.fromCenter(
        center: sizeKit.center,
        width: sizeKit.width,
        height: sizeKit.height,
      );

      _scanAreaResult = Rect.fromLTWH(
        _scanArea.left,
        _scanArea.top,
        sizeKit.width / 2,
        sizeKit.height / 8,
      );

      _scanAreaBLD = Rect.fromLTWH(
        _scanArea.left,
        _scanArea.bottom - sizeKit.height / 8,
        sizeKit.width / 3,
        sizeKit.height / 8,
      );

      _scanAreaGLU = Rect.fromLTWH(
        _scanArea.right - sizeKit.width / 3,
        _scanArea.bottom - sizeKit.height / 8,
        sizeKit.width / 3,
        sizeKit.height / 8,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Test'),
      ),
      body: Stack(
        children: [
          CameraView(
            customPaint: _customPaint,
            onImage: (inputImage) {
              processImage(inputImage);
            },
            onTakePicture: (file) async {
              final cropedFile = await _cropImage(file, context);
              Get.back(result: cropedFile!.path);
              // Get.back(result: file.path);
            },
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
          Positioned(
            left: sizeKit.left,
            top: sizeKit.top,
            height: sizeKit.height,
            width: sizeKit.width,
            child: SizedBox(
              width: sizeKit.width,
              height: sizeKit.height,
              child: ValueListenableBuilder<bool>(
                valueListenable: _checkInArea,
                builder: (context, inArea, child) {
                  return SvgPicture.asset(
                    _kitMask,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: _scanAreaResult.left,
            top: _scanAreaResult.top,
            height: _scanAreaResult.height,
            width: _scanAreaResult.width,
            child: Container(
              color: Colors.yellow.withAlpha(30),
            ),
          ),
          Positioned(
            left: _scanAreaBLD.left,
            top: _scanAreaBLD.top,
            height: _scanAreaBLD.height,
            width: _scanAreaBLD.width,
            child: Container(
              color: Colors.yellow.withAlpha(30),
            ),
          ),
          Positioned(
            left: _scanAreaGLU.left,
            top: _scanAreaGLU.top,
            height: _scanAreaGLU.height,
            width: _scanAreaGLU.width,
            child: Container(
              color: Colors.yellow.withAlpha(30),
            ),
          ),
          Positioned(
            left: _scanArea.left,
            top: _scanArea.top,
            height: _scanArea.height,
            width: _scanArea.width,
            child: Container(
              color: Colors.blue.withAlpha(30),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    print('SIZE PAINTER: $sizeCamera');
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null && inputImage.inputImageData?.imageRotation != null) {
      final painter = TextRecognizerPainter(
          recognizedText, inputImage.inputImageData!.size, inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
      // print('Area: ${_scanArea.left}');
      // print('Area: ${_scanArea.top}');
      // print('Area: ${_scanArea.width}');
      // print('Area: ${_scanArea.height}');
      // print('Result: ${_scanAreaResult.left}');
      // print('Result: ${_scanAreaResult.top}');
      // print('Result: ${_scanAreaResult.width}');
      // print('Result: ${_scanAreaResult.height}');
      // print('BLD: ${_scanAreaBLD.left}');
      // print('BLD: ${_scanAreaBLD.top}');
      // print('BLD: ${_scanAreaBLD.width}');
      // print('BLD: ${_scanAreaBLD.height}');
      // print('GLU: ${_scanAreaGLU.left}');
      // print('GLU: ${_scanAreaGLU.top}');
      // print('GLU: ${_scanAreaGLU.width}');
      // print('GLU: ${_scanAreaGLU.height}');
      for (final textBlock in recognizedText.blocks) {
        if (textBlock.text == 'GLU' || textBlock.text == 'BLD' || textBlock.text == 'Result card') {
          final left = translateX(textBlock.boundingBox.left, inputImage.inputImageData!.imageRotation, sizeCamera,
              inputImage.inputImageData!.size);
          final top = translateY(textBlock.boundingBox.top, inputImage.inputImageData!.imageRotation, sizeCamera,
              inputImage.inputImageData!.size);
          final right = translateX(textBlock.boundingBox.right, inputImage.inputImageData!.imageRotation, sizeCamera,
              inputImage.inputImageData!.size);
          final bottom = translateY(textBlock.boundingBox.bottom, inputImage.inputImageData!.imageRotation, sizeCamera,
              inputImage.inputImageData!.size);
          final rect = Rect.fromLTRB(left, top, right, bottom);
          rectTexts[textBlock.text.trim()] = rect;
          // print('${textBlock.text.trim()} Left: $left --- block : ${textBlock.boundingBox.left}');
          // print('${textBlock.text.trim()} Top: $top --- block : ${textBlock.boundingBox.top}');
          // print('${textBlock.text.trim()} Right: $right --- block : ${textBlock.boundingBox.right}');
          // print('${textBlock.text.trim()} Bottom: $bottom --- block : ${textBlock.boundingBox.bottom}');
        }
      }
      if (rectTexts.length > 2) {
        final a = _scanAreaResult.contains(rectTexts['Result card']!.topLeft);
        final b = _scanAreaBLD.contains(rectTexts['BLD']!.bottomLeft);
        final c = _scanAreaGLU.contains(rectTexts['GLU']!.bottomRight);
        // print('A : $a');
        // print('B : $b');
        // print('C : $c');
        _checkInArea.value = a && b && c; //&& containsGLU && containsBLD;
      } else {
        _checkInArea.value = false;
      }
    } else {
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<File?> _cropImage(XFile takeImage, BuildContext contexted) async {
    final fileBytes = await takeImage.readAsBytes();
    final image = img.decodeImage(fileBytes);
    // final image = await img.decodeImageFile(takeImage.path);
    //img.decodeImage(File(takeImage.filePath).readAsBytesSync())!;
    // final imageLow = img.copyResize(image!, width: image.width, height: image.height);
    final croppedImage = img.copyCrop(
      image!,
      x: (image.width * 0.20).toInt(), //62.1
      y: (image.height * 0.21).toInt(), //138.6
      width: (image.width * 0.573).toInt(), //351.9
      height: (image.height * 0.577).toInt(), //653.4
    );
    return File(takeImage.path)..writeAsBytesSync(img.encodeJpg(croppedImage));
  }
}
