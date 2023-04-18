/*
 * File: owner_profile_edit_page.dart
 * File Created: Tuesday, 18th April 2023 10:24:54 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:01:34 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class OwnerProfileEditPage extends StatelessWidget {
  const OwnerProfileEditPage({super.key});

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
                  title: 'John Doe',
                  subtitle: 'john.doe@gmail.com',
                ),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'First Name',
                  hintText: 'First Name',
                ),
                const AppTextField(
                  label: 'Last Name',
                  hintText: 'Last Name',
                ),
                const AppTextField(
                  label: 'Email',
                  hintText: 'Email',
                ),
                const AppTextField(
                  label: 'Date of Birth',
                  hintText: 'Date of Birth',
                ),
                const AppTextField(
                  label: 'Country',
                  hintText: 'Country',
                ),
                const AppTextField(
                  label: 'City',
                  hintText: 'City',
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
