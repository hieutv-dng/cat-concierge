import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';

import 'widgets/custom_awesome_bottom_actions.dart';
import 'widgets/custom_awesome_capture_button.dart';
import 'widgets/kit_preview_overlay.dart';
import 'widgets/mlkit_utils.dart';
import 'widgets/painters/text_detector_painter.dart';

class CameraScanPage extends StatefulWidget {
  const CameraScanPage({super.key});

  @override
  State<CameraScanPage> createState() => _CameraScanPageState();
}

class _CameraScanPageState extends State<CameraScanPage> {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final _imageAndText = ValueNotifier<Tuple2<AnalysisImage?, RecognizedText?>>(const Tuple2(null, null));

  Future<String> _path(CaptureMode captureMode) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir = await Directory('${extDir.path}/test').create(recursive: true);
    final String fileExtension = captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
    final String filePath = '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Test'),
      ),
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          pathBuilder: () => _path(CaptureMode.photo),
        ),
        // saveConfig: SaveConfig.photoAndVideo(
        //   photoPathBuilder: () => path(CaptureMode.photo),
        //   videoPathBuilder: () => path(CaptureMode.video),
        //   initialCaptureMode: CaptureMode.photo,
        // ),
        flashMode: FlashMode.auto,
        aspectRatio: CameraAspectRatios.ratio_16_9,
        previewFit: CameraPreviewFit.cover,
        onMediaTap: (mediaCapture) {
          OpenFilex.open(mediaCapture.filePath);
        },
        previewDecoratorBuilder: (state, previewSize, previewRect) {
          // return ValueListenableBuilder(
          //   valueListenable: _imageAndText,
          //   builder: (context, tuple, child) {
          //     return KitPreviewOverlay(
          //       state: state,
          //       previewSize: previewSize,
          //       previewRect: previewRect,
          //       recognizedText: tuple.item2,
          //       analysisImage: tuple.item1,
          //       isDetectBarcodeInArea: true,
          //       // isDrawBarcodeTracking: true,
          //     );
          //   },
          // );

          return ValueListenableBuilder(
            valueListenable: _imageAndText,
            builder: (context, tuple, child) {
              final img = tuple.item1;
              if (img?.size != null && img?.inputImageRotation != null && tuple.item2 != null) {
                final painter = TextRecognizerPainter(
                  tuple.item2!,
                  img!.size,
                  img!.inputImageRotation,
                );
                return CustomPaint(painter: painter);
              }
              return const SizedBox();
            },
          );
        },
        topActionsBuilder: (state) => const SizedBox(),
        // topActionsBuilder: (state) {
        //   return AwesomeTopActions(
        //     state: state,
        //     children: [
        //       AwesomeFlashButton(state: state),
        //       if (state is PhotoCameraState) AwesomeAspectRatioButton(state: state),
        //     ],
        //   );
        // },
        middleContentBuilder: (state) {
          return const SizedBox.shrink();
        },
        bottomActionsBuilder: (state) {
          return CustomAwesomeBottomActions(
            state: state,
            left: Builder(builder: (context) {
              final theme = AwesomeThemeProvider.of(context).theme;
              return AwesomeCameraSwitchButton(
                state: state,
                theme: theme.copyWith(
                  buttonTheme: theme.buttonTheme.copyWith(
                    backgroundColor: Colors.white12,
                  ),
                ),
                onSwitchTap: (state) {
                  state.switchCameraSensor(
                    aspectRatio: state.sensorConfig.aspectRatio,
                  );
                },
              );
            }),
            captureButton: CustomAwesomeCaptureButton(
              state: state,
              onTakenPhoto: (mediaCapture) async {
                if (mediaCapture != null && mediaCapture.status == MediaCaptureStatus.success) {
                  final cropedFile = await _cropImage(mediaCapture, context);
                  Get.back(result: cropedFile?.path);
                }
              },
            ),
            right: Builder(builder: (context) {
              final theme = AwesomeThemeProvider.of(context).theme;
              return AwesomeFlashButton(
                state: state,
                theme: theme.copyWith(
                    buttonTheme: theme.buttonTheme.copyWith(
                  backgroundColor: Colors.white12,
                )),
              );
            }),
          );
        },
        onImageForAnalysis: (img) => _processImage(img),
        imageAnalysisConfig: AnalysisConfig(
          androidOptions: const AndroidAnalysisOptions.nv21(
            width: 512,
          ),
          maxFramesPerSecond: 10,
          cupertinoOptions: const CupertinoAnalysisOptions.bgra8888(),
        ),
      ),
    );
  }

  Future _processImage(AnalysisImage img) async {
    try {
      final recognizedText = await _textRecognizer.processImage(img.toInputImage());
      _imageAndText.value = Tuple2(img, recognizedText);
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }

  Future<File?> _cropImage(MediaCapture takeImage, BuildContext contexted) async {
    final image = await img.decodeImageFile(takeImage.filePath);
    //img.decodeImage(File(takeImage.filePath).readAsBytesSync())!;
    final imageLow = img.copyResize(image!, width: image.width ~/ 4, height: image.height ~/ 4);
    final croppedImage = img.copyCrop(
      imageLow,
      x: (imageLow.width * 0.178).toInt(),
      y: (imageLow.height * 0.135).toInt(),
      width: (imageLow.width * 0.66).toInt(),
      height: (imageLow.height * 0.73).toInt(),
    );
    return File(takeImage.filePath)..writeAsBytesSync(img.encodeJpg(croppedImage));
  }
}
