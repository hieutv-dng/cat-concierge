/*
 * File: step_10_body.dart
 * File Created: Sunday, 16th April 2023 10:58:36 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:46:42 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

enum Answer { yes, no }

class Step10Body extends StatefulWidget {
  const Step10Body({super.key});

  @override
  State<Step10Body> createState() => _Step10BodyState();
}

class _Step10BodyState extends State<Step10Body> {
  Answer gender = Answer.yes;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('Does your cat have any medical conditions?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readonly: true,
          focusedColor: gender == Answer.yes ? AppColors.primaryLightest : null,
          borderColor: gender == Answer.yes ? AppColors.primaryLightest : null,
          fillColor: gender == Answer.yes ? AppColors.primaryLightest : null,
          prefixIcon: gender == Answer.yes ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Yes',
          onTap: () {
            setState(() {
              gender = Answer.yes;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readonly: true,
          focusedColor: gender == Answer.no ? AppColors.primaryLightest : null,
          borderColor: gender == Answer.no ? AppColors.primaryLightest : null,
          fillColor: gender == Answer.no ? AppColors.primaryLightest : null,
          prefixIcon: gender == Answer.no ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'No',
          onTap: () {
            setState(() {
              gender = Answer.no;
            });
          },
        ),
      ],
    );
  }
}
