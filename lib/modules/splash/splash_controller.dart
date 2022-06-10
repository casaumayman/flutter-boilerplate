import 'dart:async';

import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class SplashController extends GetxController {
  StreamSubscription? _sub;

  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    // var storage = Get.find<SharedPreferences>();
    initUniLinks();
    try {
      Get.toNamed(Routes.CALENDAR_HOME);
      // if (storage.getString(StorageConstants.token) != null) {
      //   Get.toNamed(Routes.HOME);
      // } else {
      //   Get.toNamed(Routes.AUTH);
      // }
    } catch (e) {
      Get.toNamed(Routes.AUTH);
    }
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
      handleLink(initialLink);
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
    _sub = linkStream.listen((String? uri) {
      handleLink(uri);
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  void handleLink(String? link) {
    print("Link open app: $link");
  }

  @override
  void onClose() {
    _sub?.cancel();
  }
}
