/*
 * File: pet_family_item.dart
 * File Created: Sunday, 16th April 2023 11:00:55 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Sunday, 16th April 2023 11:01:10 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class PetFamilyCardItem extends StatelessWidget {
  const PetFamilyCardItem({
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
                  width: theme.spacing.large,
                  height: theme.spacing.large,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: theme.shape.borderRadius,
                  ),
                  child: ClipRRect(
                    borderRadius: theme.shape.borderRadius,
                    child: Image.asset(MyImages.img_pixel),
                  ),
                ),
                SizedBox(width: theme.spacing.base),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.bodyMedium),
                      Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.darkGreyLight)),
                    ],
                  ),
                ),
                if (onTap != null) ...[
                  SizedBox(width: theme.spacing.base),
                  Icon(Icons.keyboard_arrow_right_rounded, color: theme.primaryColor),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
