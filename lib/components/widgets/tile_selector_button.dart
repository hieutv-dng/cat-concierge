/*
 * File: tile_selector_button.dart
 * File Created: Friday, 30th December 2022 11:41:02 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 30th December 2022 11:43:08 am
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';
import 'package:one/one.dart';

class TileSelectorButton extends StatelessWidget {
  const TileSelectorButton({
    super.key,
    this.text,
    required this.hint,
    this.prefixHintIcon,
    required this.onTap,
  });

  final String? text;
  final String hint;
  final IconData? prefixHintIcon;
  final VoidCallback onTap;

  bool get _hasText => text?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: theme.shape.borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: theme.shape.borderRadius,
            color: theme.cardTheme.color,
          ),
          padding: theme.spacing.edgeInsets,
          child: Row(
            children: [
              if (_hasText)
                Expanded(child: Text(text!))
              else
                Expanded(
                    child: Row(
                  children: [
                    if (prefixHintIcon != null) ...[Icon(prefixHintIcon!, color: theme.colorScheme.primary), SizedBox(width: theme.spacing.small)],
                    Text(hint, style: TextStyle(color: theme.colorScheme.primary)),
                  ],
                )),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
