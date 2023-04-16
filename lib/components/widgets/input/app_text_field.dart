/*
 * File: app_text_filed.dart
 * File Created: Saturday, 15th April 2023 11:33:51 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Saturday, 15th April 2023 11:33:56 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'one_text_field.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintStyle,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.text,
    this.title,
    this.autofocus,
    this.readonly,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.borderColor,
    this.focusedColor,
    this.borderRadius,
    this.keyboardType,
  });

  final TextStyle? hintStyle;
  final String? hintText;
  final String? text;
  final String? title;
  final String? suffixIcon;
  final String? prefixIcon;
  final bool? autofocus;
  final bool? readonly;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedColor;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title!, style: AppTextStyle.fromContext(context).headingH5),
          ),
        OneTextField(
          keyboardType: keyboardType,
          onTap: onTap,
          readOnly: readonly ?? false,
          text: text,
          onChanged: (value) => onChanged,
          autofocus: autofocus ?? false,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: focusedColor ?? AppColors.primary,
              ),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: borderColor ?? AppColors.lightGreyDark,
              ),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16)),
            ),
            hintStyle: hintStyle,
            hintText: hintText,
            filled: true,
            fillColor: fillColor ?? Colors.white,
            prefixIcon: (prefixIcon != null)
                ? InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(prefixIcon!, width: 16, height: 16),
                      ],
                    ),
                  )
                : null,
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
        ),
      ],
    );
  }
}
