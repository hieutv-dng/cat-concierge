/*
 * File: handle_redirect_middleware.dart
 * File Created: Wednesday, 28th September 2022 2:32:10 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 28th September 2022 2:32:42 pm
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleRedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (kDebugMode) {
      print('redirect $route');
    }
    if (route?.contains('/splash') ?? false) return null;

    // handle redirect when uninitialized
    final coldDeeplink = _handleColdDeeplink(route);
    if (coldDeeplink != null) return RouteSettings(name: coldDeeplink);

    return null;
  }
}

/// Returns the [SplashPage.path] with the target location as a redirect if the
/// app is not initialized.
String? _handleColdDeeplink(String? route) {
  final isInitialized = Get.find<ApplicationController>().state == ApplicationState.initialized;

  return !isInitialized
      ? '${SplashPage.path}'
          '?redirect=$route'
      : null;
}
