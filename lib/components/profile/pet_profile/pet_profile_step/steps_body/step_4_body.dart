/*
 * File: step_4_body.dart
 * File Created: Sunday, 16th April 2023 10:58:34 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:32:19 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

enum Answer { yes, no }

class Step4Body extends StatefulWidget {
  const Step4Body({super.key});

  @override
  State<Step4Body> createState() => _Step4BodyState();
}

class _Step4BodyState extends State<Step4Body> {
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
          child: Text('Has your cat been\nneutered/sterilised?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readOnly: true,
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
          readOnly: true,
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
