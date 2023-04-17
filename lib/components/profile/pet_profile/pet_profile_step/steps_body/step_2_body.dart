/*
 * File: step_2_body.dart
 * File Created: Sunday, 16th April 2023 10:58:26 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Sunday, 16th April 2023 11:26:31 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

enum Genders { male, female }

class Step2Body extends StatefulWidget {
  const Step2Body({super.key});

  @override
  State<Step2Body> createState() => _Step2BodyState();
}

class _Step2BodyState extends State<Step2Body> {
  Genders gender = Genders.male;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('What is your cat’s gender?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readOnly: true,
          focusedColor: gender == Genders.male ? AppColors.primaryLightest : null,
          borderColor: gender == Genders.male ? AppColors.primaryLightest : null,
          fillColor: gender == Genders.male ? AppColors.primaryLightest : null,
          prefixIcon: gender == Genders.male ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Male',
          onTap: () {
            setState(() {
              gender = Genders.male;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readOnly: true,
          focusedColor: gender == Genders.female ? AppColors.primaryLightest : null,
          borderColor: gender == Genders.female ? AppColors.primaryLightest : null,
          fillColor: gender == Genders.female ? AppColors.primaryLightest : null,
          prefixIcon: gender == Genders.female ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Female',
          onTap: () {
            setState(() {
              gender = Genders.female;
            });
          },
        ),
      ],
    );
  }
}
