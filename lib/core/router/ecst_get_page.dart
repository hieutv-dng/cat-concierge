/*
 * File: ecst_get_page.dart
 * File Created: Wednesday, 28th September 2022 2:25:35 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 28th September 2022 2:28:17 pm
 * Modified By: Hieu Tran
 */

import 'package:get/get.dart';

import 'handle_redirect_middleware.dart';

class EcstGetPage<T> extends GetPage<T> {
  EcstGetPage({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    List<Bindings>? bindings,
  }) : super(
          name: name,
          page: page,
          binding: binding,
          bindings: bindings ?? const [],
          middlewares: [HandleRedirectMiddleware()],
        );
}
