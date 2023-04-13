/*
 * File: main_page.dart
 * File Created: Wednesday, 7th December 2022 9:56:28 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 12th December 2022 2:38:12 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FavoritePage(),
          ExpensesPage(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Invoices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_rounded),
              label: 'Expenses',
            ),
          ],
          currentIndex: controller.currentPageIndex,
          onTap: (index) => controller.currentPageIndex = index,
        );
      }),
    );
  }
}
