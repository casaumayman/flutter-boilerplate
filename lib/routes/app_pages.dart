import 'package:car_cleaning_demo/modules/auth/auth.dart';
import 'package:car_cleaning_demo/modules/home/home.dart';
import 'package:car_cleaning_demo/modules/me/cards/cards_screen.dart';
import 'package:car_cleaning_demo/modules/modules.dart';
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
        name: Routes.HOME,
        page: () => HomeScreen(),
        children: [
          GetPage(name: Routes.CARDS, page: () => CardsScreen()),
        ]),
  ];
}
