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
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import '../account/authentication/register/controller/register_controller.dart';

class PetProfileCreatePage extends GetView<RegisterController> {
  const PetProfileCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    return Stack(
      children: [
        bgMain(context),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(MySvgs.logo),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Hello, John Doe!', style: style.headingH1),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Please complete a profile for your cat to get\nprecise results and advice from urine test.',
                    style: style.bodyM,
                    textAlign: TextAlign.center,
                  ),
                ),
                _buildNextBtn(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Let’s Go', style: TextStyle(color: Colors.white)),
        onTap: () {
          // Get.toNamed('/lookup-shop');
        },
      ),
    );
  }

  Widget bgMain(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: AppColors.gradientMain,
      ),
    );
  }
}
