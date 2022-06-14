import 'dart:async';

import 'package:bluetooth_app/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    // var storage = Get.find<SharedPreferences>();
    Get.toNamed(Routes.HOME);
  }
}
