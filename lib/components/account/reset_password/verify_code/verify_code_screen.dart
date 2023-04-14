/*
 * File: verify_code_screen.dart
 * File Created: Sunday, 19th February 2023 12:30:59 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 12:31:11 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:one/one.dart';

import 'widgets/pin_code_input.dart';
import 'widgets/timer_view.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verify Code'),
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
              children: [
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: Text.rich(
                    const TextSpan(
                      text: 'Please enter the code we just sent to phone number ',
                      children: [
                        TextSpan(text: '(+1) 234 567 XXX', style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: theme.spacing.base),
                Padding(
                  padding: theme.spacing.edgeInsets,
                  child: const PinCodeInput(),
                ),
                Padding(
                  padding: theme.spacing.edgeInsets,
                  child: const TimerView(),
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
        onTap: () => context.flow<ResetPasswordFlowStep>().update((_) => ResetPasswordFlowStep.createNewPassword),
      ),
    );
  }
}
