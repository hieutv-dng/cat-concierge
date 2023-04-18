/*
 * File: step_12_body.dart
 * File Created: Monday, 17th April 2023 8:13:22 am
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 5:49:01 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

enum Answer { housekeeping, goes_outside }

class Step12Body extends StatefulWidget {
  const Step12Body({super.key});

  @override
  State<Step12Body> createState() => _Step12BodyState();
}

class _Step12BodyState extends State<Step12Body> {
  Answer gender = Answer.housekeeping;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('Сat maintenance:', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readOnly: true,
          focusedColor: gender == Answer.housekeeping ? AppColors.primaryLightest : null,
          borderColor: gender == Answer.housekeeping ? AppColors.primaryLightest : null,
          fillColor: gender == Answer.housekeeping ? AppColors.primaryLightest : null,
          prefixIcon: gender == Answer.housekeeping ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Housekeeping',
          onTap: () {
            setState(() {
              gender = Answer.housekeeping;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readOnly: true,
          focusedColor: gender == Answer.goes_outside ? AppColors.primaryLightest : null,
          borderColor: gender == Answer.goes_outside ? AppColors.primaryLightest : null,
          fillColor: gender == Answer.goes_outside ? AppColors.primaryLightest : null,
          prefixIcon: gender == Answer.goes_outside ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Goes outside',
          onTap: () {
            setState(() {
              gender = Answer.goes_outside;
            });
          },
        ),
      ],
    );
  }
}
