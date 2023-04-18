/*
 * File: reset_with_email_screen.dart
 * File Created: Sunday, 19th February 2023 12:19:47 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 12:23:56 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class ResetWithEmailScreen extends StatelessWidget {
  const ResetWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
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
                    'Enter your email, we will send a verification code to email',
                    style: theme.textTheme.labelMedium,
                  ),
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
        onTap: () => context.flow<ResetPasswordFlowStep>().update((_) => ResetPasswordFlowStep.verifyCode),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppTextField(
      onChanged: (value) {},
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Type your email',
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: theme.spacing.edgeInsets,
          child: SvgPicture.asset(MySvgs.ic_user),
        ),
      ),
    );
  }
}
