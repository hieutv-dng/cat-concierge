/*
 * File: application_controller.dart
 * File Created: Wednesday, 28th September 2022 3:06:34 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 28th September 2022 3:08:03 pm
 * Modified By: Hieu Tran
 */

import 'package:get/get.dart';

enum ApplicationState {
  uninitialized,
  initialized,
}

class ApplicationController extends GetxController {
  ApplicationController();

  late final _stateController = ApplicationState.uninitialized.obs;
  ApplicationState get state => _stateController.value;

  Future<void> initialize({String? redirect}) async {
    _stateController(ApplicationState.initialized);
    Get.offAndToNamed(redirect ?? '/');
  }
}
