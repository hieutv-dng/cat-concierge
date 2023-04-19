/*
 * File: owner_profile_page.dart
 * File Created: Sunday, 16th April 2023 3:07:45 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 17th April 2023 2:03:36 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class OwnerProfilePage extends StatelessWidget {
  const OwnerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            OneButton.text(
              label: const Text('Edit'),
              onTap: () => Get.toNamed('/owner-profile-edit'),
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
          PetFamilyCardItem(
            title: 'John Doe',
            subtitle: 'john.doe@gmail.com',
            avatar: Image.asset(MyImages.img_john),
          ),
          SizedBox(height: theme.spacing.base),
          OneCard(
            child: Column(
              children: [
                SettingMenuTile(
                  title: 'Change Password',
                  onTap: () {},
                ),
                SettingMenuTile(
                  title: 'Log Out',
                  showArrowRight: false,
                  onTap: () {},
                ),
                SettingMenuTile(
                  title: 'Delete Account',
                  showArrowRight: false,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
