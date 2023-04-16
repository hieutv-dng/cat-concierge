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
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final style = AppTextStyle.fromContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: theme.spacing.edgeInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Sign up', style: style.headingH3),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Create an account to get started', style: style.bodyS),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('First Name', style: style.headingH5),
                ),
                const AppTextField(hintText: 'First Name'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Last Name', style: style.headingH5),
                ),
                const AppTextField(hintText: 'Last Name'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Email', style: style.headingH5),
                ),
                AppTextField(
                  hintText: 'Email',
                  onChanged: (value) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child:
                      Text('Sorry, but your email should be between 6 and 30 characters.\nExample: taras12@gmail.com ', style: style.bodyXS.copyWith(color: AppColors.errorDark)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Date of Birth', style: style.headingH5),
                ),
                const AppTextField(hintText: 'Date of Birth', suffixIcon: MySvgs.ic_calendar_blank),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Country', style: style.headingH5),
                ),
                const AppTextField(hintText: 'Country', suffixIcon: MySvgs.ic_caret_down),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('City', style: style.headingH5),
                ),
                const AppTextField(hintText: 'City', suffixIcon: MySvgs.ic_caret_down),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Password', style: style.headingH5),
                ),
                const PasswordInputView(hintText: 'Create a passaword'),
                const SizedBox(height: 8),
                const PasswordInputView(hintText: 'Confirm password'),
                _buildCheckboxTermsAndPrivacy(context),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: _buildNextBtn(context),
        ),
        _buildSignInBtn(context),
      ],
    );
  }

  Widget _buildCheckboxTermsAndPrivacy(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    return OneCheckbox(
      onChanged: (isChecked) {},
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.symmetric(vertical: 16),
      label: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'I\'ve read and agree with the ', style: style.bodyS),
            TextSpan(text: 'Terms and Conditions ', style: style.actionM.copyWith(color: AppColors.primary)),
            TextSpan(text: '\nand ', style: style.bodyS),
            TextSpan(text: 'Privacy Policy', style: style.actionM.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Create Account', style: TextStyle(color: Colors.white)),
        onTap: () {
          // Get.toNamed('/lookup-shop');
        },
      ),
    );
  }

  Widget _buildSignInBtn(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: style.bodyS),
        OneButton.text(
          label: Text('Login', style: style.actionM.copyWith(color: AppColors.primary)),
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
            child: SvgPicture.asset(MySvgs.ic_user),
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
            child: SvgPicture.asset(MySvgs.ic_user),
          ),
        ),
      ),
    );
  }
}
