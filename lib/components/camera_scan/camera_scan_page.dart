/*
 * File: camera_scan_page.dart
 * File Created: Wednesday, 26th April 2023 10:31:56 am
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 26th April 2023 11:34:59 pm
 * Modified By: Hieu Tran
 */

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as img;

import 'camera_detector_view.dart';
import 'widgets/painters/coordinates_translator.dart';
import 'widgets/painters/text_detector_painter.dart';

class CameraScanPage extends StatefulWidget {
  const CameraScanPage({super.key});

  @override
  State<CameraScanPage> createState() => _CameraScanPageState();
}

class _CameraScanPageState extends State<CameraScanPage> {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  final _checkInArea = ValueNotifier<bool>(false);
  Rect sizeKit = Rect.zero;
  Rect _scanArea = Rect.zero;
  Rect _scanAreaResult = Rect.zero;
  Rect _scanAreaSG = Rect.zero;
  Rect _scanAreaBLD = Rect.zero;
  Size _sizeCamera = const Size(0, 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> dispose() async {
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
    if (sizeCamera != _sizeCamera) {
      _sizeCamera = sizeCamera;
      sizeKit = Rect.fromCenter(
          center: Offset(sizeCamera.width / 2, sizeCamera.height / 2),
          width: sizeCamera.width * 0.62,
          height: sizeCamera.height * 0.65);

      _scanArea = Rect.fromCenter(
        center: sizeKit.center,
        width: sizeKit.width,
        height: sizeKit.height,
      );

      _scanAreaResult = Rect.fromLTWH(
        _scanArea.left,
        _scanArea.top,
        sizeKit.width / 3,
        sizeKit.height / 10,
      );

      _scanAreaSG = Rect.fromLTWH(
        _scanArea.left,
        _scanArea.bottom - sizeKit.height / 10,
        sizeKit.width / 3,
        sizeKit.height / 10,
      );

      _scanAreaBLD = Rect.fromLTWH(
        _scanArea.right - sizeKit.width / 3,
        _scanArea.bottom - sizeKit.height / 3.5,
        sizeKit.width / 3,
        sizeKit.height / 10,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Test'),
      ),
      body: Stack(
        children: [
          CameraDetectorView(
            customPaint: _customPaint,
            onImage: (inputImage) {
              processImage(inputImage);
            },
            onTakePicture: (file) async {
              final cropedFile = await _cropImage(file, context);
              EasyLoading.dismiss();
              Get.back(result: cropedFile!.path);
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
                    MySvgs.kit_mask,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(inArea ? Colors.green : Colors.red, BlendMode.srcIn),
                  );
                },
              ),
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
    final rectTexts = <String, Rect>{};
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null && inputImage.inputImageData?.imageRotation != null) {
      final painter = TextRecognizerPainter(
          recognizedText, inputImage.inputImageData!.size, inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
      for (final textBlock in recognizedText.blocks) {
        if (textBlock.text == 'SG' || textBlock.text == 'BLD' || textBlock.text == 'Results card') {
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
        }
      }
      if (rectTexts.length > 2) {
        final result = _scanAreaResult.contains(rectTexts['Results card']!.topLeft);
        final sg = _scanAreaSG.contains(rectTexts['SG']!.bottomLeft);
        final bld = _scanAreaBLD.contains(rectTexts['BLD']!.bottomRight);
        _checkInArea.value = result && sg && bld; //&& containsSG && containsBLD;
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
    final croppedImage = img.copyCrop(
      image!,
      x: (image.width * 0.25).toInt(),
      y: (image.height * 0.21).toInt(),
      width: (image.width * 0.5).toInt(),
      height: (image.height * 0.585).toInt(),
    );
    return File(takeImage.path)..writeAsBytesSync(img.encodeJpg(croppedImage));
  }
}
