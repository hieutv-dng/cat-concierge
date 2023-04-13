/*
 * File: main_page_controller.dart
 * File Created: Monday, 12th December 2022 2:28:23 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 12th December 2022 2:38:08 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}

class MainPageController extends GetxController {
  final _currentPageIndex = 0.obs;
  final pageController = PageController();

  int get currentPageIndex => _currentPageIndex.value;
  set currentPageIndex(int index) {
    pageController.jumpToPage(index);
    _currentPageIndex.value = index;
  }
}
