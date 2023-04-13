/*
 * File: lookup_shop_flow.dart
 * File Created: Monday, 13th February 2023 4:27:25 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 13th February 2023 4:28:36 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_shop_information/add_shop_information1_screen.dart';
import 'add_shop_information/add_shop_information2_screen.dart';
import 'controller/lookup_shop_flow_controller.dart';
import 'lookup/lookup_screen.dart';
import 'verified_successfully/verified_successfully_screen.dart';

class LookupShopFlow extends StatelessWidget {
  const LookupShopFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<LookupShopFlowStep>(
      state: Get.find<LookupShopFlowController>().flowStep,
      onGeneratePages: (state, pages) {
        switch (state) {
          case LookupShopFlowStep.lookup:
            return [
              GetPage(
                name: '/lookup-shop/lookup',
                page: () => const LookupScreen(),
                // binding: LoginBinding(),
              )
            ];
          case LookupShopFlowStep.addInformation1:
            return [
              GetPage(
                name: '/lookup-shop/lookup',
                page: () => const LookupScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/lookup-shop/add-information1',
                page: () => const AddShopInformation1Screen(),
                // binding: ResetPasswordBinding(),
              ),
            ];
          case LookupShopFlowStep.addInformation2:
            return [
              GetPage(
                name: '/lookup-shop/lookup',
                page: () => const LookupScreen(),
                // binding: LoginBinding(),
              ),
              GetPage(
                name: '/lookup-shop/add-information1',
                page: () => const AddShopInformation1Screen(),
                // binding: ResetPasswordBinding(),
              ),
              GetPage(
                name: '/lookup-shop/add-information2',
                page: () => const AddShopInformation2Screen(),
                // binding: ResetPasswordBinding(),
              ),
            ];
          case LookupShopFlowStep.verifedSuccessfully:
            return [
              GetPage(
                name: '/lookup-shop/verified-successfully',
                page: () => const VerifiedSuccessfullyScreen(),
                // binding: LoginBinding(),
              ),
            ];
        }
      },
    );
  }
}
