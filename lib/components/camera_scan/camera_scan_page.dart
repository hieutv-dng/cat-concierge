import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';

import 'widgets/custom_awesome_bottom_actions.dart';
import 'widgets/custom_awesome_capture_button.dart';
import 'widgets/kit_preview_overlay.dart';
import 'widgets/mlkit_utils.dart';
import 'package:image/image.dart' as img;

class CameraScanPage extends StatefulWidget {
  const CameraScanPage({super.key});

  @override
  State<CameraScanPage> createState() => _CameraScanPageState();
}

class _CameraScanPageState extends State<CameraScanPage> {
  final _barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.qrCode]);
  final _imageAndBarcodes = ValueNotifier<Tuple2<AnalysisImage?, List<Barcode>>>(const Tuple2(null, []));

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
          return ValueListenableBuilder(
            valueListenable: _imageAndBarcodes,
            builder: (context, tuple, child) {
              return KitPreviewOverlay(
                state: state,
                previewSize: previewSize,
                previewRect: previewRect,
                barcodes: tuple.item2,
                analysisImage: tuple.item1,
                isDetectBarcodeInArea: true,
                isDrawBarcodeTracking: false,
              );
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
              onTakenPhoto: (mediaCapture) {
                if (mediaCapture != null && mediaCapture.status == MediaCaptureStatus.success) {
                  _cropImage(mediaCapture, context);
                  // Navigator.of(context).pop(mediaCapture.filePath);
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
            width: 1024,
          ),
          maxFramesPerSecond: 30,
        ),
      ),
    );
  }

  Future _processImage(AnalysisImage img) async {
    try {
      final recognizedBarCodes = await _barcodeScanner.processImage(img.toInputImage());
      _imageAndBarcodes.value = Tuple2(img, recognizedBarCodes);
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }

  Future _cropImage(MediaCapture takeImage, BuildContext contexted) async {
    final image = await img.decodeImageFile(takeImage.filePath); //img.decodeImage(File(takeImage.filePath).readAsBytesSync())!;
    final imageLow = img.copyResize(image!, width: image.width ~/ 4, height: image.height ~/ 4);
    final croppedImage = img.copyCrop(
      imageLow,
      x: (imageLow.width * 0.178).toInt(),
      y: (imageLow.height * 0.135).toInt(),
      width: (imageLow.width * 0.66).toInt(),
      height: (imageLow.height * 0.73).toInt(),
    );
    File(takeImage.filePath).writeAsBytesSync(img.encodeJpg(croppedImage));
    if (!mounted) return;
    Navigator.of(contexted).pop(takeImage.filePath);
  }
}
