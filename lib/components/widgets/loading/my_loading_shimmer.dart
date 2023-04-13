/*
 * File: my_loading_shimmer.dart
 * File Created: Monday, 6th February 2023 11:24:09 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 6th February 2023 11:24:34 am
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';
import 'package:one/one.dart';
import 'package:shimmer/shimmer.dart';

class MyLoadingShimmer extends StatelessWidget {
  const MyLoadingShimmer({
    Key? key,
    this.itemCount = 20,
    this.color,
  }) : super(key: key);

  final int itemCount;
  final Color? color;
  Color get _color => color ?? Colors.white70;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: theme.spacing.edgeInsets,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade50,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: itemCount,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 48.0, height: 48.0, color: _color),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: double.infinity, height: 8.0, color: _color),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(width: double.infinity, height: 8.0, color: _color),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(width: 40.0, height: 8.0, color: _color),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
