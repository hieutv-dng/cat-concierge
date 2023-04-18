/*
 * File: step_3_body.dart
 * File Created: Sunday, 16th April 2023 10:58:29 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:29:39 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

class Step3Body extends StatelessWidget {
  const Step3Body({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('How old is your kitty?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        const AppTextField(
          hintText: '1 year',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
