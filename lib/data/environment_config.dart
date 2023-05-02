// ignore_for_file: constant_identifier_names, non_constant_identifier_names

/*
 * File: environment_config.dart
 * File Created: Wednesday, 10th August 2022 2:29:18 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 10th August 2022 2:41:12 pm
 * Modified By: Hieu Tran
 */

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static const DF_FLAVOR = String.fromEnvironment('DF_FLAVOR');
  static const BASE_URL = String.fromEnvironment('BASE_URL');
  static bool get API_LOGGER => dotenv.env['API_LOGGER'] == 'TRUE';
  static String? get PROXY => dotenv.env['PROXY'];

  static Future<bool> isPhysicalDevice() async {
    if (Platform.isAndroid) {
      final andInfo = await DeviceInfoPlugin().androidInfo;
      return andInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      return iosInfo.isPhysicalDevice;
    }

    return false;
  }
}
