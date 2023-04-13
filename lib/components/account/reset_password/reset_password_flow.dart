/*
 * File: reset_password_flow.dart
 * File Created: Saturday, 18th February 2023 4:21:54 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 18th February 2023 4:26:42 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/reset_password_flow_controller.dart';
import 'create_new_password/create_new_password_screen.dart';
import 'password_changed_successfully/password_changed_successfully_screen.dart';
import 'reset_with/reset_with_email_screen.dart';
import 'reset_with/reset_with_phone_screen.dart';
import 'select_method/select_method_reset_screen.dart';
import 'verify_code/verify_code_screen.dart';

class ResetPasswordFlow extends StatelessWidget {
  const ResetPasswordFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<ResetPasswordFlowStep>(
      state: Get.find<ResetPasswordFlowController>().flowStep,
      onGeneratePages: (state, pages) {
        switch (state) {
          case ResetPasswordFlowStep.selectMethod:
            return [
              GetPage(
                name: '/reset-password/select-method',
                page: () => const SelectMethodResetScreen(),
                // binding: LoginBinding(),
              )
            ];
          case ResetPasswordFlowStep.withEmail:
            return [
              GetPage(
                name: '/reset-password/select-method',
                page: () => const SelectMethodResetScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/reset-password/with-email',
                page: () => const ResetWithEmailScreen(),
                // binding: LoginBinding(),
              ),
            ];
          case ResetPasswordFlowStep.withPhone:
            return [
              GetPage(
                name: '/reset-password/select-method',
                page: () => const SelectMethodResetScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/reset-password/with-phone',
                page: () => const ResetWithPhoneScreen(),
                // binding: LoginBinding(),
              ),
            ];
          case ResetPasswordFlowStep.verifyCode:
            return [
              GetPage(
                name: '/reset-password/select-method',
                page: () => const SelectMethodResetScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/reset-password/verify-code',
                page: () => const VerifyCodeScreen(),
                // binding: LoginBinding(),
              ),
            ];
          case ResetPasswordFlowStep.createNewPassword:
            return [
              GetPage(
                name: '/reset-password/select-method',
                page: () => const SelectMethodResetScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/reset-password/create-new-password',
                page: () => const CreateNewPasswordScreen(),
                // binding: LoginBinding(),
              ),
            ];

          case ResetPasswordFlowStep.successfully:
            return [
              GetPage(
                name: '/lookup-shop/password-changed-successfully',
                page: () => const PasswordChangedSuccessfullyScreen(),
                // binding: LoginBinding(),
              ),
            ];
        }
      },
    );
  }
}
