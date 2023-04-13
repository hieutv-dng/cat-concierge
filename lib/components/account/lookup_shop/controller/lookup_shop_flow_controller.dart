/*
 * File: lookup_shop_flow_controller.dart
 * File Created: Monday, 13th February 2023 4:29:05 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 13th February 2023 4:29:35 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'lookup_shop_flow_state.dart';

class LookupShopFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LookupShopFlowController>(() => LookupShopFlowController());
  }
}

class LookupShopFlowController extends GetxController {
  // final _authRepository = Get.find<AuthRepository>();

  final _flowStepController = LookupShopFlowStep.lookup.obs;
  LookupShopFlowStep get flowStep => _flowStepController.value;

  final _stateController = const LookupShopFlowState().obs;
  LookupShopFlowState get state => _stateController.value;

  @override
  void onInit() {
    ever<LookupShopFlowState>(_stateController, (state) {
      if (state.status == LookupShopFlowStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == LookupShopFlowStatus.success) {
        Get.back();
      }

      if (state.status == LookupShopFlowStatus.failure) {
        // Get.snackbar('login_page.login_failure'.tr(), state.errorMessage ?? 'login_page.login_failure'.tr());
      }
    });
    super.onInit();
  }
}
