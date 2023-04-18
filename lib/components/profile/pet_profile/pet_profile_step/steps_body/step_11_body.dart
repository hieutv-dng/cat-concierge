/*
 * File: step_11_body.dart
 * File Created: Monday, 17th April 2023 8:13:22 am
 * Author: Dương Trí
 * -----
 * Last Modified: Monday, 17th April 2023 5:49:09 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class Step11Body extends StatefulWidget {
  const Step11Body({super.key});

  @override
  State<Step11Body> createState() => _Step11BodyState();
}

class _Step11BodyState extends State<Step11Body> {
  final List<Options> _listOptional = [
    Options(name: 'My cat is health', isSelected: false),
    Options(name: 'Arthritis', isSelected: false),
    Options(name: 'Cancer', isSelected: false),
    Options(name: 'Cystitis', isSelected: false),
    Options(name: 'Diabetes', isSelected: false),
    Options(name: 'Diarrhoea of an unknown cause', isSelected: false),
    Options(name: 'Epilepsy', isSelected: false),
    Options(name: 'Hyperthyroidism', isSelected: false),
    Options(name: 'Inflammatory bowel disease', isSelected: false),
    Options(name: 'Chronic Kidney Disease (CKD)', isSelected: false),
    Options(name: 'Liver Disease', isSelected: false),
    Options(name: 'Pancreatitis', isSelected: false),
    Options(name: 'Urinary disease', isSelected: false),
    Options(name: 'Other', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyle.fromContext(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spacing.large),
          child: Text('Please, select all medical conditions that your cat  has:',
              style: styles.headingH1, textAlign: TextAlign.start),
        ),
        Column(
            children: _listOptional.map((e) {
          return _buildItemOption(
            context,
            e,
          );
        }).toList()),
        Padding(
          padding: EdgeInsets.only(bottom: theme.spacing.small),
          child: const AppTextField(
            maxLines: 10,
            label: 'Add further details if required',
            hintText: 'Placeholder',
          ),
        ),
      ],
    );
  }

  Widget _buildItemOption(BuildContext context, Options item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppTextField(
        readOnly: true,
        selectionEnable: false,
        focusedColor: item.isSelected ? AppColors.primaryLightest : AppColors.lightGrey,
        borderColor: item.isSelected ? AppColors.primaryLightest : null,
        fillColor: item.isSelected ? AppColors.primaryLightest : null,
        suffixIcon: item.isSelected ? MySvgs.ic_check : null,
        suffixColor: AppColors.primary,
        text: item.name,
        onTap: () {
          setState(() {
            item.isSelected = !item.isSelected;
          });
        },
      ),
    );
  }
}

class Options {
  Options({required this.name, required this.isSelected});
  String name;
  bool isSelected;
}
