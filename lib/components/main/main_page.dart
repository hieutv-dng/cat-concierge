/*
 * File: main_page.dart
 * File Created: Thursday, 9th February 2023 8:03:00 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:08:02 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';
import 'package:tuple/tuple.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  List<Tuple2<String, String>> get _barItems => const [
        Tuple2('Home', MySvgs.ic_house),
        Tuple2('Scan Test', MySvgs.ic_scan),
        Tuple2('Results', MySvgs.ic_tube),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SizedBox(),
          ResultsPage(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return AnimatedBottomNavigationBar.builder(
          itemCount: _barItems.length,
          tabBuilder: (index, isActive) {
            final color = isActive ? AppColors.highlight : AppColors.darkGreyLightest;
            final item = _barItems[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(item.item2, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
                Text(
                  item.item1,
                  style: theme.textTheme.bodySmall?.copyWith(color: color),
                ),
              ],
            );
          },
          gapLocation: GapLocation.none,
          leftCornerRadius: theme.spacing.large,
          rightCornerRadius: theme.spacing.large,
          activeIndex: controller.currentPageIndex,
          onTap: (index) => controller.currentPageIndex = index,
        );
      }),
    );
  }
}
