/*
 * File: step_13_body.dart
 * File Created: Monday, 17th April 2023 8:13:22 am
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 5:52:36 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

import 'step_11_body.dart';

class Step13Body extends StatefulWidget {
  const Step13Body({super.key});

  @override
  State<Step13Body> createState() => _Step13BodyState();
}

class _Step13BodyState extends State<Step13Body> {
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('What does he usually eat?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        Column(
            children: listFoods.map((e) {
          return _buildItemOption(
            context,
            e,
          );
        }).toList()),
      ],
    );
  }

  Widget _buildItemOption(BuildContext context, Options item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppTextField(
        readOnly: true,
        selectionEnable: false,
        focusedColor: item.isSelected ? AppColors.primaryLightest : AppColors.lightGrey,
        borderColor: item.isSelected ? AppColors.primaryLightest : null,
        fillColor: item.isSelected ? AppColors.primaryLightest : null,
        suffixIcon: item.isSelected ? MySvgs.ic_check : null,
        suffixColor: AppColors.primary,
        text: item.name,
        onTap: () {
          setState(() {
            item.isSelected = !item.isSelected;
          });
        },
      ),
    );
  }
}
