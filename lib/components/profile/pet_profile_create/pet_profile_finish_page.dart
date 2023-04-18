/*
 * File: pet_profile_create_screen.dart
 * File Created: Sunday, 16th April 2023 1:10:36 am
 * Author: Dương Trí
 * -----
 * Last Modified: Sunday, 16th April 2023 1:15:20 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'controller/pet_profile_create_controller.dart';

class PetProfileFinishPage extends GetView<PetProfileCreateController> {
  const PetProfileFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: AppBackground(
          showBottomCircle: true,
          child: SafeArea(
            top: false,
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(MySvgs.bg_happy),
            SvgPicture.asset(MySvgs.logo_white),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Pet Account Created!', style: style.headingH1),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Dear user, your pet\'s account has been\nsuccessfully created.',
                style: style.bodyM,
                textAlign: TextAlign.center,
              ),
            ),
            _buildNextBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Continue', style: TextStyle(color: Colors.white)),
        onTap: () {
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
