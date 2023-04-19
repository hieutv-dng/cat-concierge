/*
 * File: pet_profile_page.dart
 * File Created: Tuesday, 18th April 2023 11:06:59 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:09:40 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class PetProfilePage extends StatelessWidget {
  const PetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            OneButton.text(
              label: const Text('Edit'),
              onTap: () => Get.toNamed('/pet-profile-edit'),
            ),
          ],
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final listMC = ['Arthritis', 'Inflammatory bowel disease', 'Cystitis'];
    final listFood = ['Raw', 'HOME-COOKED'];
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PetFamilyCardItem(
            title: 'Pixel',
            subtitle: '5 years old',
            avatar: Image.asset(MyImages.img_pixel),
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Name',
            text: 'Pixel',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Age or dob',
            text: '5 years old',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Gender',
            text: 'Male',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Male',
            text: 'Yes',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Breed',
            text: '3 kg',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Activity',
            text: 'Explorer',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TagSelector(title: 'Medical Conditionals', data: listMC),
          ),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Maintenance',
            text: 'Housekeeping',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Appetite',
            text: 'Good',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TagSelector(title: 'Food', data: listFood),
          ),
          const AppTextField(
            readOnly: true,
            focusedColor: AppColors.lightGrey,
            label: 'Amount of Food',
            text: '150 g',
          ),
        ],
      ),
    );
  }
}
