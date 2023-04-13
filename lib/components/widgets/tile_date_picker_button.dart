/*
 * File: tile_date_picker_button.dart
 * File Created: Thursday, 29th December 2022 1:50:05 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 29th December 2022 1:50:41 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class TileDatePickerButton extends StatelessWidget {
  const TileDatePickerButton({
    Key? key,
    required this.label,
    required this.date,
    this.minDate,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final DateTime date;
  final DateTime? minDate;
  final ValueChanged<DateTime>? onChanged;

  String get dateTxt => OneDateUtils.convertFrom(date, toFormat: 'dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        final firstDate = minDate ?? DateTime(DateTime.now().year - 100);
        final lastDate = firstDate.compareTo(DateTime.now()) >= 0
            ? DateTime(firstDate.year + 10)
            : DateTime(DateTime.now().year + 10);
        final initialDate = firstDate.compareTo(date) > 0 ? firstDate : date;
        final dateChanged = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
        );
        if (dateChanged != null) onChanged?.call(dateChanged);
      },
      child: Padding(
        padding: theme.spacing.edgeInsets,
        child: Column(
          children: [
            Row(
              children: [
                Text(label),
                const Spacer(),
                Text(dateTxt, style: TextStyle(color: theme.colorScheme.primary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
