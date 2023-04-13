/*
 * File: profile_menu_tile.dart
 * File Created: Wednesday, 15th February 2023 8:03:24 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Wednesday, 15th February 2023 8:03:31 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flutter/material.dart';
import 'package:one/one.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
    this.color,
  });

  final Widget leadingIcon;
  final String title;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: theme.shape.borderRadius,
        ),
        padding: theme.spacing.smallEdgeInsets,
        child: leadingIcon,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      onTap: onTap,
    );
  }
}
