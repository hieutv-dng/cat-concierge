/*
 * File: authentication_flow_controller.dart
 * File Created: Saturday, 11th February 2023 2:00:35 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 11th February 2023 2:02:33 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'authentication_flow_state.dart';

class AuthenticationFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationFlowController>(() => AuthenticationFlowController());
  }
}

class AuthenticationFlowController extends GetxController {
  // final _authRepository = Get.find<AuthRepository>();

  final _flowStepController = AuthenticationFlowStep.signIn.obs;
  AuthenticationFlowStep get flowStep => _flowStepController.value;

  final _stateController = const AuthenticationFlowState().obs;
  AuthenticationFlowState get state => _stateController.value;

  @override
  void onInit() {
    ever<AuthenticationFlowState>(_stateController, (state) {
      if (state.status == AuthenticationFlowStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == AuthenticationFlowStatus.success) {
        Get.back();
      }

      if (state.status == AuthenticationFlowStatus.failure) {
        // Get.snackbar('login_page.login_failure'.tr(), state.errorMessage ?? 'login_page.login_failure'.tr());
      }
    });
    super.onInit();
  }
}
