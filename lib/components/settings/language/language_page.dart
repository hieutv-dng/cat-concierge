/*
 * File: language_page.dart
 * File Created: Thursday, 2nd February 2023 2:26:54 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 2nd February 2023 2:35:49 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import 'model/language.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();

  static Future<Language?> show() async {
    return await Get.to<Language?>(
      () => const LanguagePage(),
      binding: LanguageBinding(),
    );
  }
}

class _LanguagePageState extends State<LanguagePage> {
  final _controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Language'),
        ),
        body: SafeArea(child: _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      if (_controller.state.status == LanguageStatus.loading) {
        return const MyLoadingShimmer();
      }

      if (_controller.state.status == LanguageStatus.failure) {
        final errorMessage = _controller.state.errorMessage;
        return Center(child: Text(errorMessage.toString()));
      }
      final languages = _controller.languages;
      return Card(
        margin: theme.spacing.edgeInsets,
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final item = languages.elementAt(index);
            final isCurrentLanguage = Get.locale?.languageCode == item.isoCode;
            return Column(
              children: [
                ListTile(
                  title: Text(item.name, style: isCurrentLanguage ? TextStyle(color: theme.primaryColor) : null),
                  trailing: isCurrentLanguage ? Icon(Icons.check, color: theme.primaryColor) : null,
                  onTap: () => Get.back(result: item),
                ),
                const Divider(height: 0),
              ],
            );
          },
        ),
      );
    });
  }
}
