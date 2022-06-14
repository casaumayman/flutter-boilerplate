import 'package:bluetooth_app/modules/home/home.dart';
import 'package:bluetooth_app/modules/modules.dart';
import 'package:get/get.dart';



part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => HomeScreen())
  ];
}
