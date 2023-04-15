/*
 * File: app_text_filed.dart
 * File Created: Saturday, 15th April 2023 11:33:51 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Saturday, 15th April 2023 11:33:56 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'one_text_field.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintStyle,
    this.hintText,
    this.onChanged,
    this.text,
    this.autofocus,
    this.suffixIcon,
  });

  final TextStyle? hintStyle;
  final String? hintText;
  final String? text;
  final String? suffixIcon;
  final bool? autofocus;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneTextField(
      text: text,
      onChanged: (value) => onChanged,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: (suffixIcon != null)
            ? InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(suffixIcon!, width: 16, height: 16),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
