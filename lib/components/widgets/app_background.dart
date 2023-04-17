/*
 * File: app_background.dart
 * File Created: Sunday, 16th April 2023 8:06:45 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 6:11:00 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            bgMain(context),
            Positioned(
              top: -width * 0.5,
              left: -width * 0.31,
              child: bigCircle(width),
            ),
            // Positioned(
            //   bottom: -width * 0.73,
            //   right: -width * 0.42,
            //   child: bigCircle(width),
            // ),
            Positioned(
              top: -width * 0.38,
              left: -width * 0.43,
              child: bigCircleBorder(width),
            ),
            Positioned(
              top: -width * 0.65,
              right: -width * 0.23,
              child: bigCircleBorder(width),
            ),
            Container(),
            SafeArea(child: child),
          ],
        ));
  }

  Widget bigCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bigCircleBorder(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1),
        // color: AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bgMain(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: AppColors.gradientMain,
      ),
    );
  }
}
