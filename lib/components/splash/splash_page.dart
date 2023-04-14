/*
 * File: splash_page.dart
 * File Created: Thursday, 2nd February 2023 4:37:39 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 3rd February 2023 10:56:51 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class SplashPage extends StatefulWidget {
  static const name = 'splash';
  static const path = '/splash';

  const SplashPage({
    this.redirect,
    super.key,
  });

  /// The name of the route the user should be redirected to after
  /// initialization.
  final String? redirect;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // start app initialization
      await Future<void>.delayed(const Duration(milliseconds: 500));
      Get.find<ApplicationController>().initialize(redirect: widget.redirect);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            bgMain(),
            Positioned(
              top: -width * 0.5,
              left: -width * 0.31,
              child: bigCircle(width),
            ),
            Positioned(
              bottom: -width * 0.73,
              right: -width * 0.42,
              child: bigCircle(width),
            ),
            Positioned(
              top: -width * 0.38,
              left: -width * 0.43,
              child: bigCircleBorder(width),
            ),
            Positioned(
              top: -width * 0.65,
              right: -width * 0.23,
              child: bigCircleBorder(width),
            ),
            Container(),
            SafeArea(
              child: Column(
                children: [
                  _buildLogo(),
                  _buildPoweredBy(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildLogo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SvgPicture.asset(
              MySvgs.logo,
              fit: BoxFit.cover,
              height: constraints.maxWidth * .15,
            );
          }),
          const Text(
            'Welcome to',
            style: TextStyle(
              fontSize: 32,
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontFamilyFallback: ['Inter'],
            ),
          ),
          const Text(
            'Cat Concierge',
            style: TextStyle(
              fontSize: 32,
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontFamilyFallback: ['Inter'],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoweredBy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SpinKitCircle(
          color: AppColors.primary,
          size: Theme.of(context).spacing.large,
        ),
      ],
    );
  }

  Widget bigCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bigCircleBorder(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1),
        // color: AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bgMain() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: AppColors.gradientMain,
      ),
    );
  }
}
