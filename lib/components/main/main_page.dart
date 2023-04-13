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

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SizedBox(),
          SizedBox(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        style: theme.textButtonTheme.style?.copyWith(
          padding: MaterialStateProperty.all(theme.spacing.smallEdgeInsets),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        onPressed: () {},
        child: Icon(Icons.add_rounded, size: theme.spacing.large, color: Colors.white),
      ),
      bottomNavigationBar: Obx(() {
        return AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (index, isActive) {
            final color = isActive ? theme.primaryColor : Colors.grey;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  switch (index) {
                    case 0:
                      return SvgPicture.asset(MySvgs.ic_dashboard,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                    case 1:
                      return SvgPicture.asset(MySvgs.ic_note_book,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                    case 2:
                      return SvgPicture.asset(MySvgs.ic_chat, colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                    case 3:
                      return SvgPicture.asset(MySvgs.ic_user2, colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                    default:
                      return SvgPicture.asset(MySvgs.ic_dashboard,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                  }
                }),
              ],
            );
          },
          gapLocation: GapLocation.center,
          leftCornerRadius: theme.spacing.large,
          rightCornerRadius: theme.spacing.large,
          notchSmoothness: NotchSmoothness.softEdge,
          activeIndex: controller.currentPageIndex,
          onTap: (index) => controller.currentPageIndex = index,
        );
      }),
      // bottomNavigationBar: Obx(() {
      //   return BottomNavigationBar(
      //     selectedItemColor: theme.colorScheme.primary,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(MySvgs.ic_dashboard),
      //         activeIcon: SvgPicture.asset(MySvgs.ic_dashboard, color: theme.primaryColor),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(MySvgs.ic_note_book),
      //         activeIcon: SvgPicture.asset(MySvgs.ic_note_book, color: theme.primaryColor),
      //         label: 'Add',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(MySvgs.ic_chat),
      //         activeIcon: SvgPicture.asset(MySvgs.ic_chat, color: theme.primaryColor),
      //         label: 'Chat',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(MySvgs.ic_user2),
      //         activeIcon: SvgPicture.asset(MySvgs.ic_user2, color: theme.primaryColor),
      //         label: 'Profile ',
      //       ),
      //     ],
      //     currentIndex: controller.currentPageIndex,
      //     onTap: (index) => controller.currentPageIndex = index,
      //   );
      // }),
    );
  }
}
