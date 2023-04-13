/*
 * File: scapair_logo_brandview.dart
 * File Created: Saturday, 11th February 2023 2:18:45 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 11th February 2023 2:19:11 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:one/one.dart';

class SCAPairLogoBrandView extends StatelessWidget {
  const SCAPairLogoBrandView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth * .8;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                MyImages.ic_logo_pair,
                fit: BoxFit.cover,
                width: maxWidth,
              ),
              SizedBox(
                width: maxWidth,
                child: Padding(
                  padding: theme.spacing.smallEdgeInsets,
                  child: Text(
                    'Faster Supplements with SCA',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    MyImages.ic_logo_sca,
                    fit: BoxFit.cover,
                    width: maxWidth * .3,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
