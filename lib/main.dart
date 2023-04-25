/*
 * File: main.dart
 * File Created: Thursday, 30th June 2022 3:15:18 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 12th July 2022 8:58:46 am
 * Modified By: Hieu Tran
 */

import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:one/one.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await dotenv.load(fileName: '.env');
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.4), // Color for Android
      statusBarBrightness: Brightness.light, // Dark == white status bar -- for IOS.
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  final dir = (await getApplicationDocumentsDirectory()).path;
  final hivePath = '$dir/cat-concierge-db-1.0.2';

  Hive..init(hivePath)
      // ..registerAdapter(UserInfoAdapter())
      // ..registerAdapter(AddressDataAdapter())
      // ..registerAdapter(BusinessDetailsDataAdapter())
      // ..registerAdapter(CustomerDetailsDataAdapter())
      // ..registerAdapter(InvoiceDataAdapter())
      // ..registerAdapter(InvoiceItemDataAdapter())
      ;

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          path: 'assets/localization', // <-- change the path of the translation files
          fallbackLocale: const Locale('en'),
          child: MyApp(sharedPreferences: sharedPreferences)),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(
      DisplayPreferencesController(
        preferences: Preferences.basic(
          sharedPreferences: widget.sharedPreferences,
        ),
      ),
      permanent: true,
    );

    Get.put(
      ThemePreferencesController(
        preferences: Preferences.basic(
          sharedPreferences: widget.sharedPreferences,
        ),
      ),
      permanent: true,
    );

    Get.put(ThemeController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      //[showSuccess] [showError] [showInfo] [showToast] settings
      // ..displayDuration = const Duration(milliseconds: 2000)
      //[Loading] settings
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 24.0
      // ..radius = 10.0
      ..maskType = EasyLoadingMaskType.custom
      ..boxShadow = <BoxShadow>[]
      ..progressColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black54
      ..userInteractions = false
      ..dismissOnTap = false;

    return Obx(() {
      return GetMaterialApp(
        title: 'Cat Concierge',
        // restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        color: Get.isDarkMode ? Colors.black : Colors.white,
        theme: Get.find<ThemeController>().lightTheme.themeData,
        darkTheme: Get.find<ThemeController>().darkTheme.themeData,
        themeMode: ThemeMode.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/authentication',
        initialBinding: InitialBinding(),
        getPages: AppRoutes.routes,
        builder: EasyLoading.init(),
      );
    });
  }
}
