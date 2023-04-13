/*
 * File: help_center_page.dart
 * File Created: Monday, 20th February 2023 11:57:40 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 21st February 2023 3:52:42 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [_buildSliverAppBar(context)];
            },
            body: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return const SliverAppBar(
      pinned: false,
      floating: true,
      stretch: true,
      title: Text('Help Center'),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        children: [
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _SearchInput(),
          ),
          ListTile(
            title: const Text('Get started', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('How to Create Project', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('How to Create Task', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Close Account', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          Divider(height: theme.spacing.large),
          _buildGetMoreQuestions(context),
          Divider(height: theme.spacing.large),
          _buildChatWithUs(context),
        ],
      ),
    );
  }

  Widget _buildGetMoreQuestions(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: Text('Get more questions?', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: Text('You may also send a message to our customer support for further questions or information.',
              style: theme.textTheme.bodySmall),
        ),
        Container(
          width: double.infinity,
          padding: theme.spacing.smallEdgeInsets,
          child: OneButton.outlined(
            label: const Text('Get in touch with us'),
            padding: theme.spacing.edgeInsets,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildChatWithUs(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: Text('Chat with Us', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: Text('We are here to assist you better via online chat.', style: theme.textTheme.bodySmall),
        ),
        Container(
          width: double.infinity,
          padding: theme.spacing.smallEdgeInsets,
          child: OneButton.elevated(
            label: const Text('Get in touch with us', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: OneTextField(
        onChanged: (value) {},
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: theme.spacing.edgeInsets,
            child: SvgPicture.asset(MySvgs.ic_search),
          ),
        ),
      ),
    );
  }
}
