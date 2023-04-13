/*
 * File: password_changed_successfully_screen.dart
 * File Created: Sunday, 19th February 2023 2:37:40 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 2:37:58 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:one/one.dart';

class PasswordChangedSuccessfullyScreen extends StatelessWidget {
  const PasswordChangedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: theme.spacing.edgeInsets,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(builder: (context, constrains) {
                  return Padding(
                    padding: theme.spacing.edgeInsets,
                    child: SizedBox(
                      width: constrains.maxWidth * .47,
                      child: const SuccessfullyCheckCircleView(),
                    ),
                  );
                }),
                Padding(
                  padding: theme.spacing.edgeInsets,
                  child: Text(
                    'Password Changed',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: theme.spacing.large),
                  child: Text(
                    'Password changed successfully, you can login again with a new password',
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
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
      child: OneButton.card(
        label: const Text('Sign In Now'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onTap: () => context.flow<ResetPasswordFlowStep>().complete(),
      ),
    );
  }
}
