/*
 * File: setting_menu_tile.dart
 * File Created: Thursday, 13th April 2023 9:46:19 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Sunday, 16th April 2023 10:34:46 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: theme.textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        onTap: onTap,
      ),
    );
  }
}
