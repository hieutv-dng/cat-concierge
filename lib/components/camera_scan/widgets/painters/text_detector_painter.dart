/*
 * File: text_detector_painter.dart
 * File Created: Tuesday, 25th April 2023 8:45:41 am
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 26th April 2023 11:35:12 pm
 * Modified By: Dương Trí
 */

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

Size sizeCamera = const Size(0.0, 0.0);

class TextRecognizerPainter extends CustomPainter {
  TextRecognizerPainter(this.recognizedText, this.absoluteImageSize, this.rotation);

  final RecognizedText recognizedText;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  @override
  void paint(Canvas canvas, Size size) {
    sizeCamera = size;
    /** Handle draw text detector on screen 
     final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.lightGreenAccent;

    final Paint background = Paint()..color = Color(0x99000000);

    for (final textBlock in recognizedText.blocks) {
      final ParagraphBuilder builder = ParagraphBuilder(
        ParagraphStyle(textAlign: TextAlign.center, fontSize: 13, textDirection: TextDirection.ltr),
      );
      builder.pushStyle(ui.TextStyle(color: Colors.lightGreenAccent, background: background));
      builder.addText(textBlock.text);
      builder.pop();
      final left = translateX(textBlock.boundingBox.left, rotation, size, absoluteImageSize);
      final top = translateY(textBlock.boundingBox.top, rotation, size, absoluteImageSize);
      final right = translateX(textBlock.boundingBox.right, rotation, size, absoluteImageSize);
      final bottom = translateY(textBlock.boundingBox.bottom, rotation, size, absoluteImageSize);
      print('SIZE: $size');

      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        paint,
      );

      canvas.drawParagraph(
        builder.build()
          ..layout(ParagraphConstraints(
            width: right - left,
          )),
        Offset(left, top),
      );
    }
     */
  }

  @override
  bool shouldRepaint(TextRecognizerPainter oldDelegate) {
    return oldDelegate.recognizedText != recognizedText;
  }
}
