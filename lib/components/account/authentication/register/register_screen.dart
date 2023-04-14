/*
 * File: register_screen.dart
 * File Created: Sunday, 12th February 2023 11:53:18 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:53:27 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';
import 'package:one_checkbox/one_checkbox.dart';

import 'controller/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
        ),
        body: SafeArea(
          top: false,
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
                    'Create account and enjoy all services',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _UsernameInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _EmailInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: const PasswordInputView(),
                ),
                _buildCheckboxTermsAndPrivacy(context),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _buildNextBtn(context),
                ),
              ],
            ),
          ),
        ),
        _buildSignInBtn(context),
      ],
    );
  }

  Widget _buildCheckboxTermsAndPrivacy(BuildContext context) {
    final theme = Theme.of(context);
    return OneCheckbox(
      onChanged: (isChecked) {},
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: theme.spacing.edgeInsets,
      label: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'I agree to the company '),
            TextSpan(text: 'Term of Service ', style: TextStyle(color: theme.primaryColor)),
            const TextSpan(text: 'and '),
            TextSpan(text: 'Privacy Policy', style: TextStyle(color: theme.primaryColor)),
          ],
        ),
        style: theme.textTheme.labelMedium,
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        onTap: () => Get.toNamed('/lookup-shop'),
      ),
    );
  }

  Widget _buildSignInBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
        OneButton.text(
          label: Text('Sign In',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold)),
          onTap: () => context.flow<AuthenticationFlowStep>().update((_) => AuthenticationFlowStep.signIn),
        ),
      ],
    );
  }
}

class _UsernameInput extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Type your name',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_user1),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends GetView<RegisterController> {
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
