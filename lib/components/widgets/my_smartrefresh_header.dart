/*
 * File: my_smartrefresh_header.dart
 * File Created: Tuesday, 14th February 2023 6:32:34 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 6:32:55 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one/one.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MySmartRefreshHeader extends StatelessWidget {
  const MySmartRefreshHeader({
    double height = 60.0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  })  : _height = height,
        _mainAxisAlignment = mainAxisAlignment;

  final double _height;
  final MainAxisAlignment _mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomHeader(
      height: _height,
      builder: (context, mode) {
        return SizedBox(
          height: _height,
          child: Column(
            mainAxisAlignment: _mainAxisAlignment,
            children: [SpinKitThreeBounce(color: theme.primaryColor, size: theme.spacing.base)],
          ),
        );
      },
    );
  }
}
