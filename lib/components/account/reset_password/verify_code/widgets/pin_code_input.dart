/*
 * File: pincode.dart
 * File Created: Sunday, 19th February 2023 12:52:15 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 12:52:48 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:one/one.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_auth/smart_auth.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    Key? key,
  }) : super(key: key);

  @override
  State<PinCodeInput> createState() => PinCodeInputState();
}

class PinCodeInputState extends State<PinCodeInput> {
  final _pinCodeController = TextEditingController();
  final _smartAuth = SmartAuth();

  @override
  void initState() {
    if (Platform.isAndroid) {
      _smartAuth.getAppSignature().then((value) => debugPrint('Signature: $value'));
      _smartAuth.getSmsCode(matcher: r'(\d{4})', useUserConsentApi: true).then((res) {
        if (mounted && res.succeed && res.codeFound && (res.code?.isNotEmpty ?? false)) {
          final otpCode = RegExp(r'(\d{4})').stringMatch(res.code!);
          if ((otpCode?.isNotEmpty ?? false) && otpCode?.length == 4) {
            _pinCodeController.text = otpCode ?? '';
            // context.read<PhoneAuthCubit>().smsCodeChanged(_otpCode ?? '');
            _verifyOTP();
          }
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      length: 4,
      obscureText: true,
      animationType: AnimationType.fade,
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor: theme.cardTheme.color,
        inactiveFillColor: theme.cardTheme.color,
        selectedFillColor: theme.cardTheme.color,
        inactiveColor: Colors.transparent,
        borderRadius: theme.shape.borderRadius,
        borderWidth: 0.0,
      ),
      controller: _pinCodeController,
      keyboardType: TextInputType.number,
      onCompleted: (value) => _verifyOTP(),
      onChanged: (value) {
        // context.read<PhoneAuthCubit>().smsCodeChanged(value);
      },
      beforeTextPaste: (text) {
        // print('Allowing to paste $text');
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  void _verifyOTP() {
    // context.read<PhoneAuthCubit>().verifyOTP();
  }
}
