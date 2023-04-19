// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: inference_failure_on_function_return_type

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomAwesomeCaptureButton extends StatefulWidget {
  final CameraState state;
  final Function(MediaCapture? mediaCapture) onTakenPhoto;

  const CustomAwesomeCaptureButton({
    super.key,
    required this.state,
    required this.onTakenPhoto,
  });

  @override
  State<CustomAwesomeCaptureButton> createState() => _CustomAwesomeCaptureButtonState();
}

class _CustomAwesomeCaptureButtonState extends State<CustomAwesomeCaptureButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _scale;
  final Duration _duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is AnalysisController) {
      return Container();
    }
    _scale = 1 - _animationController.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: SizedBox(
        key: const ValueKey('cameraButton'),
        height: 80,
        width: 80,
        child: Transform.scale(
          scale: _scale,
          child: CustomPaint(
            painter: widget.state.when(
              onPhotoMode: (_) => CameraButtonPainter(),
              onPreparingCamera: (_) => CameraButtonPainter(),
              onVideoMode: (_) => VideoButtonPainter(),
              onVideoRecordingMode: (_) => VideoButtonPainter(isRecording: true),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(_duration, () {
      _animationController.reverse();
    });

    onTap.call();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  VoidCallback get onTap => () {
        widget.state.when(
          onPhotoMode: (photoState) async {
            EasyLoading.show();
            await photoState.takePhoto();
            final mediaCapture = photoState.captureState;
            widget.onTakenPhoto(mediaCapture);
            EasyLoading.dismiss();
          },
          onVideoMode: (videoState) => videoState.startRecording(),
          onVideoRecordingMode: (videoState) => videoState.stopRecording(),
        );
      };
}

class CameraButtonPainter extends CustomPainter {
  CameraButtonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.white.withOpacity(.5);
    canvas.drawCircle(center, radius, bgPainter);

    bgPainter.color = Colors.white;
    canvas.drawCircle(center, radius - 8, bgPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VideoButtonPainter extends CustomPainter {
  final bool isRecording;

  VideoButtonPainter({
    this.isRecording = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.white.withOpacity(.5);
    canvas.drawCircle(center, radius, bgPainter);

    if (isRecording) {
      bgPainter.color = Colors.red;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(
                17,
                17,
                size.width - (17 * 2),
                size.height - (17 * 2),
              ),
              const Radius.circular(12.0)),
          bgPainter);
    } else {
      bgPainter.color = Colors.red;
      canvas.drawCircle(center, radius - 8, bgPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
