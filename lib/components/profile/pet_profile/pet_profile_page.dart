/*
 * File: pet_profile_page.dart
 * File Created: Tuesday, 18th April 2023 11:06:59 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:09:40 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
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
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        children: [
          const PetFamilyCardItem(
            title: 'Pixel',
            subtitle: '5 years old',
          ),
          SizedBox(height: theme.spacing.base),
          const AppTextField(
            label: 'Name',
            hintText: 'Name',
          ),
          const AppTextField(
            label: 'Age or dob',
            hintText: 'Age or dob',
          ),
        ],
      ),
    );
  }
}
