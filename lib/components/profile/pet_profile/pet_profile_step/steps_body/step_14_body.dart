/*
 * File: step_14_body.dart
 * File Created: Monday, 17th April 2023 8:13:22 am
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 5:54:38 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

class Step14Body extends StatelessWidget {
  const Step14Body({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('How much food the cat eats per day?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        const AppTextField(
          hintText: '150 g',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
