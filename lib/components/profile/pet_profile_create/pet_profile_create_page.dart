/*
 * File: pet_profile_create_screen.dart
 * File Created: Sunday, 16th April 2023 1:10:36 am
 * Author: Dương Trí
 * -----
 * Last Modified: Sunday, 16th April 2023 1:15:20 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'controller/pet_profile_create_controller.dart';

class PetProfileCreatePage extends GetView<PetProfileCreateController> {
  const PetProfileCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.bgGradient,
          ),
          child: SafeArea(
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    final theme = Theme.of(context);
    return Padding(
      padding: theme.spacing.edgeInsets,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: Text('Hello, John Doe!', style: style.headingH1),
          ),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: Text(
              'Please complete a profile for your cat to get\nprecise results and advice from urine test.',
              style: style.bodyM,
              textAlign: TextAlign.center,
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
      child: OneButton.elevated(
        label: const Text('Let’s Go', style: TextStyle(color: Colors.white)),
        onTap: () {
          Get.toNamed('/pet-step-create');
        },
      ),
    );
  }
}
