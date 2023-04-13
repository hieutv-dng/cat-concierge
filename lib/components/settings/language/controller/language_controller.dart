/*
 * File: language_controller.dart
 * File Created: Monday, 6th February 2023 9:31:52 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 6th February 2023 9:33:52 am
 * Modified By: Hieu Tran
 */

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/language.dart';

part 'language_state.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}

class LanguageController extends GetxController {
  LanguageController();

  final _stateController = const LanguageState().obs;
  LanguageState get state => _stateController.value;
  List<Language> get languages => state.languages;

  @override
  Future<void> onInit() async {
    super.onInit();
    _fetchLanguage();
  }

  Future<String> _loadJsonAsset() {
    return rootBundle.loadString('assets/localization/_languages.json');
  }

  Future<void> _fetchLanguage() async {
    _stateController(state.copyWith(status: LanguageStatus.loading));
    try {
      final jsonString = await _loadJsonAsset();
      final languageData = json.decode(jsonString);
      final languages = (languageData as List<dynamic>?)?.map((e) {
            return Language.fromJson(e as Map<String, dynamic>);
          }).toList() ??
          const [];
      _stateController(state.copyWith(
        status: LanguageStatus.success,
        languages: languages,
      ));
    } catch (e) {
      _stateController(state.copyWith(status: LanguageStatus.failure, errorMessage: e.toString()));
    }
  }
}
