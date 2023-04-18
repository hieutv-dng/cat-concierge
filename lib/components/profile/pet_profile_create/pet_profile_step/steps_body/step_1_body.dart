/*
 * File: step_1_body.dart
 * File Created: Sunday, 16th April 2023 10:30:47 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Sunday, 16th April 2023 10:30:51 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

class Step1Body extends StatelessWidget {
  const Step1Body({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('What is your cat’s name?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        const AppTextField(
          hintText: 'Name',
          label: 'Name',
        ),
      ],
    );
  }
}
