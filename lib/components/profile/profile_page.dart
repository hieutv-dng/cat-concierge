/*
 * File: profile_page.dart
 * File Created: Tuesday, 14th February 2023 2:16:29 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 2:17:09 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'widgets/profile_menu_tile.dart';

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
              padding: theme.spacing.smallEdgeInsets,
              child: SvgPicture.asset(MySvgs.ic_search),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: theme.spacing.smallEdgeInsets,
              child: SvgPicture.asset(MySvgs.ic_settings),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: theme.spacing.base),
          Text('Bobs Auto Body', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: theme.spacing.small * .5),
          Text('rafiislamapon2001@workmail.com', style: theme.textTheme.bodySmall),
          SizedBox(height: theme.spacing.large),
          _buildEditBtn(context),
          SizedBox(height: theme.spacing.large),
          ProfileMenuTile(
            leadingIcon: SvgPicture.asset(MySvgs.ic_lifebuoy),
            title: 'Help Center',
            onTap: () => Get.toNamed('/help-center'),
          ),
          ProfileMenuTile(
            leadingIcon: SvgPicture.asset(MySvgs.ic_star),
            title: 'Rate the App',
            onTap: () {},
          ),
          ProfileMenuTile(
            leadingIcon: SvgPicture.asset(MySvgs.ic_eye),
            title: 'Privacy Policy',
            onTap: () => Get.toNamed('/privacy-policy'),
          ),
          ProfileMenuTile(
            leadingIcon: SvgPicture.asset(MySvgs.ic_logout),
            title: 'Log out',
            color: theme.colorScheme.error,
            onTap: () {
              MyDialog.show(
                title: 'Are you sure, you want to\nlog out?',
                confirmText: 'Logout',
                cancelText: 'Cancel',
                onConfirm: () {},
                onCancel: () {
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
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
