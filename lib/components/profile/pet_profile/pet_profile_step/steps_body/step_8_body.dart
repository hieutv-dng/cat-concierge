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

enum Appetites { good, bad, pickyinfood }

class Step8Body extends StatefulWidget {
  const Step8Body({super.key});

  @override
  State<Step8Body> createState() => _Step8BodyState();
}

class _Step8BodyState extends State<Step8Body> {
  Appetites appetites = Appetites.good;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('What is the cat’s appetite?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readonly: true,
          focusedColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
          borderColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
          fillColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
          prefixIcon: appetites == Appetites.good ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Good',
          onTap: () {
            setState(() {
              appetites = Appetites.good;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readonly: true,
          focusedColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
          borderColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
          fillColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
          prefixIcon: appetites == Appetites.bad ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Bad',
          onTap: () {
            setState(() {
              appetites = Appetites.bad;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readonly: true,
          focusedColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
          borderColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
          fillColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
          prefixIcon: appetites == Appetites.pickyinfood ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Picky in food',
          onTap: () {
            setState(() {
              appetites = Appetites.pickyinfood;
            });
          },
        ),
      ],
    );
  }
}
