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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildLogo(),
            _buildPoweredBy(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SvgPicture.asset(
              MySvgs.logo_transparent,
              colorFilter: ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
              fit: BoxFit.cover,
              height: constraints.maxWidth * .65,
            );
          }),
          Text(
            'Cat Concierge',
            style: Theme.of(context).textTheme.displayMedium,
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
          color: Colors.black45,
          size: Theme.of(context).spacing.large,
        ),
      ],
    );
  }
}
