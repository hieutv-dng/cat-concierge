/*
 * File: feedback_page.dart
 * File Created: Wednesday, 19th April 2023 8:58:39 am
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 19th April 2023 9:17:47 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
        actions: [
          OneButton.text(
            label: const Text('Edit'),
            onTap: () => {},
          ),
        ],
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final style = AppTextStyle.fromContext(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Dear John! We hope you enjoyed doing the test with us!', style: style.headingH2),
          SizedBox(height: theme.spacing.small),
          Text('Help us be better, please.', style: style.bodyL),
          SizedBox(height: theme.spacing.base),
          Text('How would you rate the Cat Concierge App?', style: style.headingH5),
        ],
      ),
    );
  }
}
