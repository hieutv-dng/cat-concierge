/*
 * File: privacy_page.dart
 * File Created: Thursday, 13th April 2023 9:46:19 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Sunday, 16th April 2023 11:41:40 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';
import 'package:one/one.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: const Text(
        '''
    Not everyone knows how to make a Privacy Policy agreement, especially with CCPA or GDPR or CalOPPA or PIPEDA or Australia's Privacy Act provisions. If you are not a lawyer or someone who is familiar to Privacy Policies, you will be clueless. Some people might even take advantage of you because of this. Some people may even extort money from you. These are some examples that we want to stop from happening to you. We will help you protect yourself by generating a Privacy Policy.\n
    Our Privacy Policy Generator can help you make sure that your business complies with the law. We are here to help you protect your business, yourself and your customers.\n
    Fill in the blank spaces below and we will create a personalized website Privacy Policy for your business. No account registration required. Simply generate & download a Privacy Policy in seconds!\n
    If you are not a lawyer or someone who is familiar to Privacy Policies, you will be clueless. Some people might even take advantage of you because of this. Some people may even extort money from you. These are some examples that we want to stop from happening to you. We will help you protect yourself by generating a Privacy Policy.\n
    Our Privacy Policy Generator can help you make sure that your business complies with the law. We are here to help you protect your business, yourself and your customers.
    ''',
        style: TextStyle(height: 1.4),
      ),
    );
  }
}
