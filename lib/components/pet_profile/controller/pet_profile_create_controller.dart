import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'pet_profile_create_state.dart';

class PetProfileCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetProfileCreateController>(() => PetProfileCreateController());
  }
}

class PetProfileCreateController extends GetxController {
  @override
  void onInit() {
    ever<PetProfileCreateState>(_stateController, (state) {
      if (state.status == PetProfileCreateStatus.loading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }

      if (state.status == PetProfileCreateStatus.success) {}

      if (state.status == PetProfileCreateStatus.failure) {}
    });
    super.onInit();
  }

  final _stateController = const PetProfileCreateState().obs;
  PetProfileCreateState get state => _stateController.value;
}
