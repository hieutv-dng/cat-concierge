/*
 * File: password_input_view.dart
 * File Created: Sunday, 12th February 2023 12:58:56 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 12:59:29 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return ValueListenableBuilder<bool>(
      valueListenable: _isObscurePass,
      builder: (context, isObscurePass, child) {
        return Card(
          child: AppTextField(
            onChanged: (value) {},
            obscureText: isObscurePass,
            hintText: widget.hintText,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  _isObscurePass.value = !_isObscurePass.value;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isObscurePass)
                      SvgPicture.asset(
                        MySvgs.ic_eye,
                        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      )
                    else
                      SvgPicture.asset(
                        MySvgs.ic_eye_slash,
                        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
