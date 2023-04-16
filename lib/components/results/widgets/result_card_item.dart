/*
 * File: result_card_item.dart
 * File Created: Monday, 17th April 2023 12:35:00 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 17th April 2023 12:37:49 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';

class ResultCardItem extends StatelessWidget {
  const ResultCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneCard(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: theme.spacing.edgeInsets,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightest,
                    borderRadius: theme.shape.borderRadius,
                  ),
                  padding: theme.spacing.smallEdgeInsets,
                  child: SvgPicture.asset(
                    MySvgs.ic_test_tube,
                    colorFilter: ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
                  ),
                ),
                SizedBox(width: theme.spacing.base),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                      SizedBox(height: theme.spacing.small * .5),
                      Text(subtitle, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                SizedBox(width: theme.spacing.base),
                Icon(Icons.keyboard_arrow_right_rounded, color: theme.primaryColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
