/*
 * File: recent_claims_gridview.dart
 * File Created: Tuesday, 14th February 2023 6:15:51 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 6:17:23 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class ScanTestCardView extends StatefulWidget {
  const ScanTestCardView({
    Key? key,
    required this.onTapScanTest,
  }) : super(key: key);

  final VoidCallback onTapScanTest;

  @override
  State<ScanTestCardView> createState() => _ScanTestCardViewState();
}

class _ScanTestCardViewState extends State<ScanTestCardView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: theme.spacing.edgeInsets,
      child: OneCard(
        child: Padding(
          padding: theme.spacing.edgeInsets,
          child: Column(
            children: [
              Text(
                'Welcome!',
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: theme.spacing.small),
              Text(
                'Let’s get started by scanning home test.',
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: theme.spacing.base),
              SizedBox(
                width: double.infinity,
                child: OneButton.elevated(
                  onTap: widget.onTapScanTest,
                  label: const Text('Scan Test'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
