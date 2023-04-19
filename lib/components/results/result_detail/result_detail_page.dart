/*
 * File: result_detail_page.dart
 * File Created: Tuesday, 18th April 2023 12:14:01 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 12:14:34 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/widgets/app_action_cardview.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';
import 'package:tuple/tuple.dart';

import 'color_result.dart';
import 'colors_result_item.dart';

class ResultDetailPage extends StatelessWidget {
  const ResultDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2 Mar, 2023')),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(children: [
        AppActionCardView(
          title: 'Doctor’s Feedback is ready',
          description: 'Description. Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do.',
          actionLabel: 'See Feedback',
          onTapAction: () {},
        ),
        SizedBox(height: theme.spacing.base),
        Column(
          children: List.generate(colorResults.length, (index) {
            final result = colorResults[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
              child: ColorsResultItem(
                colorResult: result,
              ),
            );
          }),
        )
      ]),
    );
  }
}
