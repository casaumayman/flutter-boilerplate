import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    // var storage = Get.find<SharedPreferences>();
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
}
