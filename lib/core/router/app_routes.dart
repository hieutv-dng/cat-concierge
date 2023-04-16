/*
 * File: app_pages.dart
 * File Created: Thursday, 18th August 2022 11:28:35 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 18th August 2022 11:28:44 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/components/pet_profile/pet_profile_create_page.dart';
import 'package:get/get.dart';

import 'app_get_page.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    AppGetPage<SplashPage>(
      name: SplashPage.path,
      page: () {
        final redirect = Get.parameters['redirect'];
        return SplashPage(redirect: redirect);
      },
    ),
    AppGetPage<MainPage>(
      name: '/',
      page: () => const MainPage(),
      bindings: [
        MainPageBinding(),
      ],
    ),
    AppGetPage<AuthenticationFlow>(
        name: '/authentication', page: () => const AuthenticationFlow(), binding: AuthenticationFlowBinding()),
    AppGetPage<ResetPasswordFlow>(
        name: '/reset-password', page: () => const ResetPasswordFlow(), binding: ResetPasswordFlowBinding()),
    AppGetPage<LookupShopFlow>(
        name: '/lookup-shop', page: () => const LookupShopFlow(), binding: LookupShopFlowBinding()),
    AppGetPage<MainPage>(name: '/', page: () => const MainPage(), binding: MainPageBinding()),
    AppGetPage<ProfilePage>(name: '/profile', page: () => const ProfilePage()),
    AppGetPage<EditProfilePage>(name: '/edit-profile', page: () => const EditProfilePage()),
    AppGetPage<PrivacyPage>(name: '/privacy', page: () => const PrivacyPage()),
    AppGetPage<ProfilePage>(name: '/pet-profile-create', page: () => const PetProfileCreatePage()),
  ];
}
