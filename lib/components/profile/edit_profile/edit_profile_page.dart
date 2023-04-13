/*
 * File: edit_profile_page.dart
 * File Created: Monday, 20th February 2023 9:53:50 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 20th February 2023 9:54:09 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: Text(
                    'Shop Information for Supplements',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _TaxIdInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _ShopNameInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _FirstNameInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _LastNameInput(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _Address1Input(),
                ),
                Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: _Address2Input(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: theme.spacing.edgeInsets,
          child: _buildNextBtn(context),
        ),
      ],
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Continue', style: TextStyle(color: Colors.white)),
        onTap: () {},
      ),
    );
  }
}

class _TaxIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Tax ID',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_user1),
          ),
        ),
      ),
    );
  }
}

class _ShopNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Shop Name',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'First Name',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Last Name',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}

class _Address1Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Address 1',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}

class _Address2Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Address 2',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_mail),
          ),
        ),
      ),
    );
  }
}
