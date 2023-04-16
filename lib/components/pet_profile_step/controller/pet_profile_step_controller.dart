import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'pet_profile_step_state.dart';

class PetStepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetStepController>(() => PetStepController());
  }
}

class PetStepController extends GetxController {
  @override
  void onInit() {
    ever<PetStepState>(_stateController, (state) {
      if (state.status == PetStepStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == PetStepStatus.success) {}

      if (state.status == PetStepStatus.failure) {}
    });
    super.onInit();
  }

  int progressStep = 1;

  void moveStep(bool onNext) {
    if (onNext) {
      progressStep += 1;
    } else {
      progressStep -= 1;
    }
    if (progressStep > 0) {
      update();
    } else {
      Get.back();
    }
  }

  final _stateController = const PetStepState().obs;
  PetStepState get state => _stateController.value;
}
