import 'package:car_cleaning_demo/modules/auth/auth.dart';
import 'package:car_cleaning_demo/modules/calendar/calendar.dart';
import 'package:car_cleaning_demo/modules/calendar/calendar_binding.dart';

import 'package:car_cleaning_demo/modules/modules.dart';
import 'package:car_cleaning_demo/modules/plan/plan.dart';
import 'package:car_cleaning_demo/modules/plan/plan_bingding.dart';
import 'package:car_cleaning_demo/modules/plan/controller/select_plan_controller.dart';
import 'package:car_cleaning_demo/modules/test_nfc/test_nfc.dart';
import 'package:get/get.dart';

import '../modules/calendar/calendar_home.dart';
import '../modules/plan/plan_screen.dart';

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
        page: () => CalendarHome(),

    ),
    GetPage(
        name: Routes.PLAN_SCREEN,
        binding: PlanBinding(),
        page: () => PlanScreen(),

    ),
    GetPage(
        name: Routes.TEST_NFC,
        page: () => TestNFCScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => TestNFCController()))),
    GetPage(
        name: Routes.SECLECT_PLAN_SCREEN,
        page: () => SelectPlanScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => SelectPlanCotroller()))),
    GetPage(
        name: Routes.CONFIRM_INFO_SCREEN,
        page: () => ConfirmInfoScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => ConfirmInfoController()))),
    GetPage(
        name: Routes.TABLE_INFO_SCREEN,
        page: () => TableInfoScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => TableInfoController()))),
  ];
}
