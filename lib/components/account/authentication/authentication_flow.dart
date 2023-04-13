/*
 * File: authentication_flow.dart
 * File Created: Saturday, 11th February 2023 2:00:35 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 11th February 2023 2:01:20 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/authentication_flow_controller.dart';
import 'login/controller/login_controller.dart';
import 'login/login_screen.dart';
import 'register/controller/register_controller.dart';
import 'register/register_screen.dart';

class AuthenticationFlow extends StatelessWidget {
  const AuthenticationFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthenticationFlowStep>(
      state: Get.find<AuthenticationFlowController>().flowStep,
      onGeneratePages: (state, pages) {
        switch (state) {
          case AuthenticationFlowStep.signIn:
            return [
              GetPage(
                name: '/authentication/login',
                page: () => const LoginScreen(),
                binding: LoginBinding(),
              )
            ];
          case AuthenticationFlowStep.signUp:
            return [
              GetPage(
                name: '/authentication/login',
                page: () => const LoginScreen(),
                binding: LoginBinding(),
              ),
              GetPage(
                name: '/authentication/register',
                page: () => const RegisterScreen(),
                binding: RegisterBinding(),
              ),
            ];
        }
      },
    );
  }
}
