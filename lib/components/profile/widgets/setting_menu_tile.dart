/*
 * File: setting_menu_tile.dart
 * File Created: Thursday, 13th April 2023 9:46:19 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Sunday, 16th April 2023 10:34:46 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key,
    required this.title,
    this.showArrowRight = true,
    this.onTap,
  });

  final String title;
  final bool showArrowRight;
  final VoidCallback? onTap;

  Widget? get _trailing => showArrowRight ? const Icon(Icons.keyboard_arrow_right_rounded) : null;

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
        trailing: _trailing,
        onTap: onTap,
      ),
    );
  }
}
