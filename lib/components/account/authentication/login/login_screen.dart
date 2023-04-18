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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SingleChildScrollView(
            padding: theme.spacing.edgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: theme.spacing.large),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _AccountInput(),
                  // child: _AccountInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const PasswordInputView(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
      label: Text('Forgot Password?',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          )),
      onTap: () => Get.toNamed('/reset-password'),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: Text(
          'Log In',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => Get.toNamed('/pet-profile-create'),
        // onTap: () => Get.offAllNamed('/'),
      ),
    );
  }

  Widget _buildSignUpBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Do not have account?',
            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 12)),
        OneButton.text(
          label: Text('Register now',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
          onTap: () => context.flow<AuthenticationFlowStep>().update((_) => AuthenticationFlowStep.signUp),
        ),
      ],
    );
  }
}

class _AccountInput extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: AppTextField(
        onChanged: (value) {},
        autofocus: true,
        hintText: 'Email Address',
      ),
    );
  }
}
