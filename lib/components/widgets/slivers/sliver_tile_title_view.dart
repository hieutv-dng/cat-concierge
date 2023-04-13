/*
 * File: sliver_tile_title_view.dart
 * File Created: Thursday, 22nd December 2022 3:09:47 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 22nd December 2022 3:10:05 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';

class SliverBoxTileTitleView extends StatelessWidget {
  const SliverBoxTileTitleView({
    super.key,
    required this.title,
    this.subtitle,
    this.isRequired = false,
  });

  final String title;
  final String? subtitle;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TileTitleView(
        title: title,
        subtitle: subtitle,
        isRequired: isRequired,
      ),
    );
  }
}
