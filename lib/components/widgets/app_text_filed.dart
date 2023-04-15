/*
 * File: app_text_filed.dart
 * File Created: Saturday, 15th April 2023 11:33:51 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Saturday, 15th April 2023 11:33:56 pm
 * Modified By: Dương Trí
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/index.dart';
import '../index.dart';

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
    return OneTextField(
      text: text,
      onChanged: (value) => onChanged,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        hintText: hintText,
        filled: true,
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
            color: AppColors.lightGreyDark,
            width: 1.0,
          ),
        ),
        suffixIcon: (suffixIcon != null)
            ? InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: SvgPicture.asset(
                    suffixIcon!,
                    color: Colors.grey,
                    width: 24,
                    height: 24,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
