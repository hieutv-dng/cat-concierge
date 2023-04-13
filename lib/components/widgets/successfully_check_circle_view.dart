/*
 * File: successfully_check_circle_view.dart
 * File Created: Sunday, 19th February 2023 2:39:51 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 2:40:24 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flutter/material.dart';
import 'package:one/one.dart';

class SuccessfullyCheckCircleView extends StatelessWidget {
  const SuccessfullyCheckCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        shape: BoxShape.circle,
      ),
      padding: theme.spacing.largeEdgeInsets,
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
        ),
        padding: theme.spacing.largeEdgeInsets,
        child: LayoutBuilder(builder: (context, constraints) {
          return Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: constraints.maxWidth,
          );
        }),
      ),
    );
  }
}
