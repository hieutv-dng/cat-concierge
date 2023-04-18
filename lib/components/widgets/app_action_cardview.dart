/*
 * File: action_cardview.dart
 * File Created: Tuesday, 18th April 2023 12:17:35 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 12:18:15 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class AppActionCardView extends StatefulWidget {
  const AppActionCardView({
    Key? key,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onTapAction,
  }) : super(key: key);

  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onTapAction;

  @override
  State<AppActionCardView> createState() => _AppActionCardViewState();
}

class _AppActionCardViewState extends State<AppActionCardView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneCard(
      child: Padding(
        padding: theme.spacing.edgeInsets,
        child: Column(
          children: [
            Text(
              widget.title,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: theme.spacing.small),
            Text(
              widget.description,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: theme.spacing.base),
            SizedBox(
              width: double.infinity,
              child: OneButton.elevated(
                onTap: widget.onTapAction,
                label: Text(widget.actionLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
