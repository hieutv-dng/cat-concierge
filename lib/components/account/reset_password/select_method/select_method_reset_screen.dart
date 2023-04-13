/*
 * File: select_method_reset_screen.dart
 * File Created: Saturday, 18th February 2023 4:35:37 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 18th February 2023 4:59:33 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/one.dart';

class SelectMethodResetScreen extends StatelessWidget {
  const SelectMethodResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          leading: BackButton(
            onPressed: () => context.flow<ResetPasswordFlowStep>().complete(),
          ),
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: theme.spacing.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: Text(
              'Select method to reset password',
              style: theme.textTheme.labelMedium,
            ),
          ),
          SizedBox(height: theme.spacing.base),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _MethodItemView(
              icon: SvgPicture.asset(MySvgs.ic_mail),
              title: 'Email',
              content: '**************@gmail.com',
              onTap: () => context.flow<ResetPasswordFlowStep>().update((_) => ResetPasswordFlowStep.withEmail),
            ),
          ),
          Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: _MethodItemView(
              icon: SvgPicture.asset(MySvgs.ic_phone),
              title: 'Phone Number',
              content: '**** **** **** 0120',
              onTap: () => context.flow<ResetPasswordFlowStep>().update((_) => ResetPasswordFlowStep.withPhone),
            ),
          ),
        ],
      ),
    );
  }
}

class _MethodItemView extends StatelessWidget {
  const _MethodItemView({
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: theme.shape.borderRadius,
      child: Card(
        child: Padding(
          padding: theme.spacing.edgeInsets,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(.06),
                  borderRadius: theme.shape.borderRadius,
                ),
                padding: theme.spacing.smallEdgeInsets,
                child: icon,
              ),
              SizedBox(width: theme.spacing.base),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: theme.spacing.small),
                    Text(content, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
