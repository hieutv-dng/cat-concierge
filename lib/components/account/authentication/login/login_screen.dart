/*
 * File: login_screen.dart
 * File Created: Saturday, 11th February 2023 2:00:35 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:53:40 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
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
                const Center(child: SCAPairLogoBrandView()),
                SizedBox(height: theme.spacing.large),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: Text(
                    'Give creadential to sign in your account',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _AccountInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const PasswordInputView(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildForgotPasswordBtn(context),
                  ],
                ),
                SizedBox(height: theme.spacing.base),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _buildNextBtn(context),
                ),
              ],
            ),
          ),
        ),
        _buildSignUpBtn(context),
      ],
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    final theme = Theme.of(context);
    return OneButton.text(
      label: Text('Forgot Password?', style: theme.textTheme.bodyLarge?.copyWith(color: theme.primaryColor)),
      onTap: () => Get.toNamed('/reset-password'),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Sign In', style: TextStyle(color: Colors.white)),
        onTap: () => Get.offAllNamed('/'),
      ),
    );
  }

  Widget _buildSignUpBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have account?', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
        OneButton.text(
          label: Text('Sign Up',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold)),
          onTap: () => context.flow<AuthenticationFlowStep>().update((_) => AuthenticationFlowStep.signUp),
        ),
      ],
    );
  }
}

class _AccountInput extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        autofocus: true,
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
