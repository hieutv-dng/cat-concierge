/*
 * File: tile_title_view.dart
 * File Created: Thursday, 22nd December 2022 2:58:28 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 22nd December 2022 2:58:44 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';

class TileTitleView extends StatelessWidget {
  const TileTitleView({
    super.key,
    required this.title,
    this.subtitle,
    this.isRequired = false,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final bool isRequired;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.titleMedium;
    return Row(
      children: [
        Expanded(
          child: Text.rich(TextSpan(
            text: title,
            children: isRequired ? [TextSpan(text: ' *', style: TextStyle(color: theme.colorScheme.error))] : null,
            style: style,
          )),
        ),
        if (subtitle?.isNotEmpty ?? false) Text(subtitle!, style: style),
        ...actions
      ],
    );
  }
}
