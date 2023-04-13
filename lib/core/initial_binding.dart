/*
 * File: initial_binding.dart
 * File Created: Tuesday, 23rd August 2022 1:14:23 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 23rd August 2022 1:14:32 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:get/get.dart';
// import 'package:invoice_pdf/components/components.dart';
// import 'package:invoice_pdf/data/the_data.dart';

class InitialBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    /*
    REPOSITORY
    */

    // Get.put<UserRepository>(
    //   UserRepositoryImpl(
    //     local: const UserHiveStorage(boxName: 'user-data'),
    //   ),
    //   permanent: true,
    // );

    // Get.put<InvoicesRepository>(
    //   InvoicesRepositoryImpl(
    //     remote: InvoicesServiceApi(service: InvoicesService.create()),
    //     local: const InvoicesHiveStorage(boxName: 'saved-invoices'),
    //   ),
    //   permanent: true,
    // );
    /*
    CONTROLLER
    */
    Get.put(ApplicationController(), permanent: true);
  }
}
