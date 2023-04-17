/*
 * File: step_8_body.dart
 * File Created: Sunday, 16th April 2023 10:58:35 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:43:02 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

enum Frequencys { often, normally, rarely }

class Step9Body extends StatefulWidget {
  const Step9Body({super.key});

  @override
  State<Step9Body> createState() => _Step9BodyState();
}

class _Step9BodyState extends State<Step9Body> {
  Frequencys frequencys = Frequencys.often;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('How often does the cat drink?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readOnly: true,
          focusedColor: frequencys == Frequencys.often ? AppColors.primaryLightest : null,
          borderColor: frequencys == Frequencys.often ? AppColors.primaryLightest : null,
          fillColor: frequencys == Frequencys.often ? AppColors.primaryLightest : null,
          prefixIcon: frequencys == Frequencys.often ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Often',
          onTap: () {
            setState(() {
              frequencys = Frequencys.often;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readOnly: true,
          focusedColor: frequencys == Frequencys.normally ? AppColors.primaryLightest : null,
          borderColor: frequencys == Frequencys.normally ? AppColors.primaryLightest : null,
          fillColor: frequencys == Frequencys.normally ? AppColors.primaryLightest : null,
          prefixIcon: frequencys == Frequencys.normally ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Normally',
          onTap: () {
            setState(() {
              frequencys = Frequencys.normally;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readOnly: true,
          focusedColor: frequencys == Frequencys.rarely ? AppColors.primaryLightest : null,
          borderColor: frequencys == Frequencys.rarely ? AppColors.primaryLightest : null,
          fillColor: frequencys == Frequencys.rarely ? AppColors.primaryLightest : null,
          prefixIcon: frequencys == Frequencys.rarely ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Rarely',
          onTap: () {
            setState(() {
              frequencys = Frequencys.rarely;
            });
          },
        ),
      ],
    );
  }
}
