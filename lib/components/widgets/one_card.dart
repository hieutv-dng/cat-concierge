/*
 * File: one_card.dart
 * File Created: Monday, 28th June 2021 5:05:31 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 28th June 2021 5:06:00 pm
 * Modified By: Hieu Tran
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one/one.dart';

class OneCard extends StatelessWidget {
  const OneCard({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.gradient,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned.fill(
          top: 10.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? theme.shape.borderRadius,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1D48941A),
                  blurRadius: 20.0,
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: borderRadius ?? theme.shape.borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                gradient: gradient,
                borderRadius: borderRadius ?? theme.shape.borderRadius,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
