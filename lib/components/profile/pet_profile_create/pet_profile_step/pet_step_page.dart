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

import 'controller/pet_profile_step_controller.dart';
import 'steps_body/step_10_body.dart';
import 'steps_body/step_11_body.dart';
import 'steps_body/step_12_body.dart';
import 'steps_body/step_13_body.dart';
import 'steps_body/step_14_body.dart';
import 'steps_body/step_1_body.dart';
import 'steps_body/step_2_body.dart';
import 'steps_body/step_3_body.dart';
import 'steps_body/step_4_body.dart';
import 'steps_body/step_5_body.dart';
import 'steps_body/step_6_body.dart';
import 'steps_body/step_7_body.dart';
import 'steps_body/step_8_body.dart';
import 'steps_body/step_9_body.dart';

class PetStepPage extends GetView<PetStepController> {
  const PetStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => controller.moveStepBackward(),
          ),
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProgressStep(context),
                _buildContent(context),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: OneButton.elevated(
              label: const Text('Next', style: TextStyle(color: Colors.white)),
              onTap: () {
                controller.moveStepForward();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressStep(BuildContext context) {
    return Obx(() {
      final currentStep = controller.currentStep.toDouble();

      return LayoutBuilder(
        builder: (_, boxConstraints) {
          final x = boxConstraints.maxWidth;
          final percent = (currentStep / controller.MAX_STEP) * x;
          return Stack(
            children: [
              Container(
                width: x,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightest,
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: percent,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return Obx(() {
      final currentStep = controller.currentStep;
      switch (currentStep) {
        case 1:
          return const Step1Body();
        case 2:
          return const Step2Body();
        case 3:
          return const Step3Body();
        case 4:
          return const Step4Body();
        case 5:
          return const Step5Body();
        case 6:
          return const Step6Body();
        case 7:
          return const Step7Body();
        case 8:
          return const Step8Body();
        case 9:
          return const Step9Body();
        case 10:
          return const Step10Body();
        case 11:
          return const Step11Body();
        case 12:
          return const Step12Body();
        case 13:
          return const Step13Body();
        case 14:
          return const Step14Body();

        default:
          return Container();
      }
    });
  }
}
