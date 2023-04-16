/*
 * File: step_7_body.dart
 * File Created: Sunday, 16th April 2023 10:58:35 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 12:36:09 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';

enum Actives { active, normal, passive }

class Step7Body extends StatefulWidget {
  const Step7Body({super.key});

  @override
  State<Step7Body> createState() => _Step7BodyState();
}

class _Step7BodyState extends State<Step7Body> {
  Actives actives = Actives.active;
  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('How active is your cat?', style: styles.headingH1, textAlign: TextAlign.start),
        ),
        AppTextField(
          readonly: true,
          focusedColor: actives == Actives.active ? AppColors.primaryLightest : null,
          borderColor: actives == Actives.active ? AppColors.primaryLightest : null,
          fillColor: actives == Actives.active ? AppColors.primaryLightest : null,
          prefixIcon: actives == Actives.active ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Active',
          onTap: () {
            setState(() {
              actives = Actives.active;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readonly: true,
          focusedColor: actives == Actives.normal ? AppColors.primaryLightest : null,
          borderColor: actives == Actives.normal ? AppColors.primaryLightest : null,
          fillColor: actives == Actives.normal ? AppColors.primaryLightest : null,
          prefixIcon: actives == Actives.normal ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Normal',
          onTap: () {
            setState(() {
              actives = Actives.normal;
            });
          },
        ),
        const SizedBox(height: 8),
        AppTextField(
          readonly: true,
          focusedColor: actives == Actives.passive ? AppColors.primaryLightest : null,
          borderColor: actives == Actives.passive ? AppColors.primaryLightest : null,
          fillColor: actives == Actives.passive ? AppColors.primaryLightest : null,
          prefixIcon: actives == Actives.passive ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
          text: 'Passive',
          onTap: () {
            setState(() {
              actives = Actives.passive;
            });
          },
        ),
      ],
    );
  }
}
