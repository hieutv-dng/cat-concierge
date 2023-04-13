/*
 * File: scapair_get_page.dart
 * File Created: Thursday, 9th February 2023 7:58:19 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:18:22 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:get/get.dart';

import 'handle_redirect_middleware.dart';

class AppGetPage<T> extends GetPage<T> {
  AppGetPage({
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
