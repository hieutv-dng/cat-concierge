/*
 * File: main_page_controller.dart
 * File Created: Thursday, 9th February 2023 8:03:00 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:07:56 pm
 * Modified By: Bruce Blake (hieutv)
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
