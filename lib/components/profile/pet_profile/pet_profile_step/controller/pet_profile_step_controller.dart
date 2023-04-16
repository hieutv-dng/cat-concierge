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

  final MAX_STEP = 14;
  final _currentStep = 1.obs;
  int get currentStep => _currentStep.value;
  set currentStep(int step) => _currentStep.value = step;
  void moveStepForward() {
    _currentStep.value += 1;
    if (currentStep == MAX_STEP) Get.offAllNamed('/');
  }

  void moveStepBackward() {
    _currentStep.value -= 1;
    if (currentStep == 0) Get.back();
  }

  final _stateController = const PetStepState().obs;
  PetStepState get state => _stateController.value;
}
