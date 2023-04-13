/*
 * File: register_controller.dart
 * File Created: Sunday, 12th February 2023 11:53:18 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:54:01 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'register_state.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}

class RegisterController extends GetxController {
  @override
  void onInit() {
    ever<RegisterState>(_stateController, (state) {
      if (state.status == RegisterStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == RegisterStatus.success) {}

      if (state.status == RegisterStatus.failure) {}
    });
    super.onInit();
  }

  final _stateController = const RegisterState().obs;
  RegisterState get state => _stateController.value;
}
