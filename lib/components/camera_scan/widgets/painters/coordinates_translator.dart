import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:google_mlkit_commons/google_mlkit_commons.dart';

double translateX(double x, InputImageRotation rotation, Size size, Size absoluteImageSize) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
      return x * size.width / (Platform.isIOS ? absoluteImageSize.width : absoluteImageSize.height);
    case InputImageRotation.rotation270deg:
      return size.width - x * size.width / (Platform.isIOS ? absoluteImageSize.width : absoluteImageSize.height);
    default:
      return x * size.width / absoluteImageSize.width;
  }
}

double translateY(double y, InputImageRotation rotation, Size size, Size absoluteImageSize) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return y * size.height / (Platform.isIOS ? absoluteImageSize.height : absoluteImageSize.width);
    default:
      return y * size.height / absoluteImageSize.height;
  }
}

Offset croppedPosition(
  Point<int> element, {
  required Size analysisImageSize,
  required Size croppedSize,
  required Size screenSize,
  // ratio between croppedSize and previewSize
  required double ratio,
  required bool flipXY,
}) {
  // Determine how much the image is cropped
  num imageDiffX;
  num imageDiffY;
  if (Platform.isIOS) {
    imageDiffX = analysisImageSize.width - croppedSize.width;
    imageDiffY = analysisImageSize.height - croppedSize.height;
  } else {
    // Width and height are inverted on Android
    imageDiffX = analysisImageSize.height - croppedSize.width;
    imageDiffY = analysisImageSize.width - croppedSize.height;
  }

  // Apply the imageDiff to the element position
  return (Offset(
            (flipXY ? element.y : element.x).toDouble() - (imageDiffX / 2),
            (flipXY ? element.x : element.y).toDouble() - (imageDiffY / 2),
          ) *
          ratio)
      .translate(
    // If screenSize is bigger than croppedSize, move the element to half the difference
    (screenSize.width - (croppedSize.width * ratio)) / 2,
    (screenSize.height - (croppedSize.height * ratio)) / 2,
  );
}
