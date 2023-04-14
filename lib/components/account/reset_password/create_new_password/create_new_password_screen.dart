/*
 * File: create_new_password_screen.dart
 * File Created: Sunday, 19th February 2023 2:30:24 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 2:30:43 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:one/one.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
                    'Create a new password that is safe and easy to remember',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const PasswordInputView(hintText: 'Type New password'),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const PasswordInputView(hintText: 'Confirm New password'),
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
        onTap: () => context.flow<ResetPasswordFlowStep>().update((_) => ResetPasswordFlowStep.successfully),
      ),
    );
  }
}
