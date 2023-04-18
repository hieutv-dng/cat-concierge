/*
 * File: pet_profile_edit_page.dart
 * File Created: Tuesday, 18th April 2023 11:43:56 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:44:21 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class PetProfileEditPage extends StatelessWidget {
  const PetProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          actions: [
            OneButton.text(
              icon: const Icon(Icons.close_rounded),
              onTap: () => Get.back(),
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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
          ),
        ),
        Padding(
          padding: theme.spacing.edgeInsets,
          child: _buildSaveBtn(context),
        ),
      ],
    );
  }

  Widget _buildSaveBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Save Changes', style: TextStyle(color: Colors.white)),
        onTap: () {},
      ),
    );
  }
}
