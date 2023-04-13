/*
 * File: password_input_view.dart
 * File Created: Sunday, 12th February 2023 12:58:56 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 12:59:29 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';
import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';

class PasswordInputView extends StatefulWidget {
  const PasswordInputView({
    super.key,
    this.hintText = 'Password',
  });

  final String hintText;

  @override
  State<PasswordInputView> createState() => PasswordInputViewState();
}

class PasswordInputViewState extends State<PasswordInputView> {
  final _isObscurePass = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: _isObscurePass,
      builder: (context, isObscurePass, child) {
        return Card(
          child: OneTextField(
            onChanged: (value) {},
            obscureText: isObscurePass,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textHintColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: AppColors.neutralLightDark,
                  width: 1.0,
                ),
              ),
              suffixIcon: InkWell(
                onTap: () {
                  _isObscurePass.value = !_isObscurePass.value;
                },
                child: Padding(
                    padding: theme.spacing.edgeInsets,
                    child: isObscurePass
                        // ? SvgPicture.asset(MySvgs.ic_eye_hide, colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn))
                        // : SvgPicture.asset(MySvgs.ic_eye_show, colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn))),
                        ? SvgPicture.asset(MySvgs.ic_eye_hide, color: Colors.grey)
                        : SvgPicture.asset(MySvgs.ic_eye_show, color: Colors.grey)),
              ),
            ),
          ),
        );
      },
    );
  }
}
