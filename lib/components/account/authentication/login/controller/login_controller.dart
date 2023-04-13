/*
 * File: login_controller.dart
 * File Created: Saturday, 11th February 2023 2:00:35 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 11th February 2023 2:03:56 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'login_state.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class LoginController extends GetxController {
  final _stateController = const LoginState().obs;
  LoginState get state => _stateController.value;

  @override
  void onInit() {
    ever<LoginState>(_stateController, (state) {
      if (state.status == LoginStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == LoginStatus.success) {
        Get.back();
      }

      if (state.status == LoginStatus.failure) {
        // Get.snackbar('login_page.login_failure'.tr(), state.errorMessage ?? '-');
      }
    });
    super.onInit();
  }
}
