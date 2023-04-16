/*
 * File: profile_page.dart
 * File Created: Tuesday, 14th February 2023 2:16:29 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 2:17:09 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'widgets/pet_family_item.dart';
import 'widgets/setting_menu_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          InkWell(
            child: Padding(
              padding: theme.spacing.edgeInsets,
              child: const Icon(Icons.close_rounded),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        children: [
          _buildPetFamily(context),
          SizedBox(height: theme.spacing.small),
          _buildSettingList(context),
        ],
      ),
    );
  }

  Widget _buildPetFamily(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spacing.base, horizontal: theme.spacing.small),
          child: Text(
            'Pet Family',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        PetFamilyItem(
          title: 'John Doe',
          subtitle: 'john.doe@gmail.com',
          onTap: () {},
        ),
        SizedBox(height: theme.spacing.base),
        PetFamilyItem(
          title: 'Pixel',
          subtitle: '5 years old',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSettingList(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spacing.base, horizontal: theme.spacing.small),
          child: Text(
            'Settings',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        OneCard(
          child: Column(
            children: [
              SettingMenuTile(
                title: 'Language',
                onTap: () {},
              ),
              const Divider(height: 0),
              SettingMenuTile(
                title: 'Notifications',
                onTap: () {},
              ),
              const Divider(height: 0),
              SettingMenuTile(
                title: 'Privacy & Security',
                onTap: () => Get.toNamed('/privacy'),
              ),
              const Divider(height: 0),
              SettingMenuTile(
                title: 'About Us',
                onTap: () {},
              ),
              const Divider(height: 0),
              SettingMenuTile(
                title: 'Feedback',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEditBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
        onTap: () => Get.toNamed('/edit-profile'),
      ),
    );
  }
}
