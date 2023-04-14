/*
 * File: add_shop_information2_screen.dart
 * File Created: Monday, 13th February 2023 7:18:02 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 13th February 2023 7:18:45 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class AddShopInformation2Screen extends StatelessWidget {
  const AddShopInformation2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Shop Information'),
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: theme.spacing.edgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: Text(
                    'Enter your phone number, we will send a authentication code',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _PhoneNumberInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _FaxInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _EmailInput(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: theme.spacing.edgeInsets,
          child: _buildNextBtn(context),
        ),
      ],
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Continue', style: TextStyle(color: Colors.white)),
        onTap: () => context.flow<LookupShopFlowStep>().update((_) => LookupShopFlowStep.verifedSuccessfully),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Type your phone number',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_phone),
          ),
        ),
      ),
    );
  }
}

class _FaxInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Type your fax',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_phone),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Type your email',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}
