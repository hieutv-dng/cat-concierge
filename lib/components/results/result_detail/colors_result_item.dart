/*
 * File: colors_result_item.dart
 * File Created: Wednesday, 19th April 2023 11:31:57 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 19th April 2023 11:36:08 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

import 'color_result.dart';

class ColorsResultItem extends StatelessWidget {
  const ColorsResultItem({super.key, required this.colorResult});

  final ColorResult colorResult;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                colorResult.name,
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            SvgPicture.asset(
              colorResult.isPositive ? MySvgs.ic_warning : MySvgs.ic_check_circle,
              width: theme.spacing.base,
              colorFilter: ColorFilter.mode(
                  colorResult.isPositive ? AppColors.errorDark : AppColors.successDark, BlendMode.srcIn),
            ),
            SizedBox(width: theme.spacing.small),
            Text(
              colorResult.isPositive ? 'Positive' : 'Negative',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: colorResult.isPositive ? AppColors.errorDark : AppColors.successDark),
            ),
          ],
        ),
        SizedBox(height: theme.spacing.base),
        OneCard(
          child: Padding(
            padding: theme.spacing.edgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(colorResult.colors.length, (index) {
                final item = colorResult.colors[index];
                return _ColorItemView(
                  color: Color(item.item2),
                  label: item.item1,
                  isChecked: colorResult.index == index,
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorItemView extends StatelessWidget {
  const _ColorItemView({
    required this.color,
    required this.label,
    this.isChecked = false,
  });

  final Color color;
  final String label;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isChecked ? Icon(Icons.check_rounded, size: theme.spacing.base) : null,
        ),
        SizedBox(height: theme.spacing.small * .5),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: AppColors.darkGrey),
        ),
      ],
    );
  }
}
