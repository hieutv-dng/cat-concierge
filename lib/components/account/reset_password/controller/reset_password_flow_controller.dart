/*
 * File: reset_password_flow_controller.dart
 * File Created: Saturday, 18th February 2023 4:27:05 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 18th February 2023 4:27:34 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'reset_password_flow_state.dart';

class ResetPasswordFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordFlowController>(() => ResetPasswordFlowController());
  }
}

class ResetPasswordFlowController extends GetxController {
  // final _authRepository = Get.find<AuthRepository>();

  final _flowStepController = ResetPasswordFlowStep.selectMethod.obs;
  ResetPasswordFlowStep get flowStep => _flowStepController.value;

  final _stateController = const ResetPasswordFlowState().obs;
  ResetPasswordFlowState get state => _stateController.value;

  @override
  void onInit() {
    ever<ResetPasswordFlowState>(_stateController, (state) {
      if (state.status == ResetPasswordFlowStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == ResetPasswordFlowStatus.success) {
        Get.back();
      }

      if (state.status == ResetPasswordFlowStatus.failure) {
        // Get.snackbar('login_page.login_failure'.tr(), state.errorMessage ?? 'login_page.login_failure'.tr());
      }
    });
    super.onInit();
  }
}
