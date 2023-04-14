import 'package:flutter/material.dart';

class BarcodeFocusAreaPainter extends CustomPainter {
  final Size scanArea;
  final Color color;

  BarcodeFocusAreaPainter({
    required this.scanArea,
    this.color = Colors.white70,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clippedRect = getClippedRect(size);
    // Draw a semi-transparent overlay outside of the scan area
    canvas.drawPath(
      clippedRect,
      Paint()..color = Colors.black38,
    );

    // canvas.drawLine(
    //   Offset(size.width / 2 - scanArea.width / 2, size.height / 2),
    //   Offset(size.width / 2 + scanArea.width / 2, size.height / 2),
    //   Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 2,
    // );
    // Add border around the scan area
    canvas.drawPath(
      getInnerRect(size),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = color
        ..strokeWidth = 3,
    );
  }

  Path getInnerRect(Size size) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            (size.width - scanArea.width) / 2,
            (size.height - scanArea.height) / 2,
            scanArea.width,
            scanArea.height,
          ),
          const Radius.circular(32),
        ),
      );
  }

  Path getClippedRect(Size size) {
    final fullRect = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final innerRect = getInnerRect(size);
    // Substract innerRect from fullRect
    return Path.combine(
      PathOperation.difference,
      fullRect,
      innerRect,
    );
  }

  @override
  bool shouldRepaint(covariant BarcodeFocusAreaPainter oldDelegate) {
    return scanArea != oldDelegate.scanArea || color != oldDelegate.color;
  }
}
