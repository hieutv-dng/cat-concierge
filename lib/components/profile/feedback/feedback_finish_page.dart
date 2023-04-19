/*
 * File: feedback_finish_page.dart
 * File Created: Wednesday, 19th April 2023 5:14:55 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 19th April 2023 5:15:07 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';

class FeedBackFinishPage extends StatelessWidget {
  const FeedBackFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: AppBackground(
          showBottomCircle: true,
          child: SafeArea(
            top: false,
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTextStyle.fromContext(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(MySvgs.bg_happy),
            SvgPicture.asset(MySvgs.logo_finish_feedback),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Thanks for your\nfeedback!', style: style.headingH1),
            ),
          ],
        ),
      ),
    );
  }
}
