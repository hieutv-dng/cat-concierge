/*
 * File: lookup_screen.dart
 * File Created: Monday, 13th February 2023 4:33:26 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 13th February 2023 4:33:53 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class LookupScreen extends StatelessWidget {
  const LookupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lookup Shop'),
          leading: BackButton(
            onPressed: () => context.flow<LookupShopFlowStep>().complete(),
          ),
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: Text(
              'Search by Phone or Tax ID',
              style: theme.textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _TaxIdInput(),
          ),
          Padding(
            padding: theme.spacing.edgeInsets,
            child: Text(
              'OR',
              style: theme.textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _PhoneNumberInput(),
          ),
          SizedBox(height: theme.spacing.large),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _buildNextBtn(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Continue', style: TextStyle(color: Colors.white)),
        onTap: () => context.flow<LookupShopFlowStep>().update((_) => LookupShopFlowStep.addInformation1),
      ),
    );
  }
}

class _TaxIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: AppTextField(
        onChanged: (value) {},
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Tax ID',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_user),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: AppTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Type your phone number',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_user),
          ),
        ),
      ),
    );
  }
}
