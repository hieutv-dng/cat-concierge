// ignore_for_file: constant_identifier_names, non_constant_identifier_names

/*
 * File: my_svgs.dart
 * File Created: Friday, 3rd February 2023 11:00:07 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 3rd February 2023 11:01:18 am
 * Modified By: Hieu Tran
 */

class MySvgs {
  MySvgs._();
  static const Exception exception = Exception();

  static const String logo = 'assets/logo/ic_launcher.svg';
  static const String logo_transparent = 'assets/logo/ic_launcher_transparent.svg';
}

class Exception {
  const Exception();
  String get empty_data => 'assets/svgs/empty_data.svg';
  String get something_went_wrong => 'assets/svgs/something_went_wrong.svg';
}
