import 'package:car_cleaning_demo/modules/auth/auth.dart';
import 'package:car_cleaning_demo/modules/calendar/calendar_binding.dart';

import 'package:car_cleaning_demo/modules/modules.dart';
import 'package:car_cleaning_demo/modules/test_nfc/test_nfc.dart';
import 'package:get/get.dart';

import '../modules/calendar/calendar_home.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
        name: Routes.CALENDAR_HOME,
        binding: CalendarBinding(),
        page: () => CalendarHome()),
    GetPage(
        name: Routes.TEST_NFC,
        page: () => TestNFCScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => TestNFCController()))),
  ];
}
