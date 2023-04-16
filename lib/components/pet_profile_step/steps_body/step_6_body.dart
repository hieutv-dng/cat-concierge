/*
 * File: step_6_body.dart
 * File Created: Sunday, 16th April 2023 10:58:35 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:34:51 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class Step6Body extends StatelessWidget {
  const Step6Body({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('What is the cat\'s breed?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        const AppTextField(
          hintText: '3 kg',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
