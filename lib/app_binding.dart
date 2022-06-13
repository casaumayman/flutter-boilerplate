
import 'package:car_cleaning_demo/api/api.dart';
import 'package:car_cleaning_demo/calendar_api/api_provider.dart';
import 'package:car_cleaning_demo/calendar_api/api_repository.dart';
import 'package:get/get.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);


    Get.put(UserApiProvider(), permanent: true);
    Get.put(UserApiRepository(apiProvider: Get.find()), permanent: true);

  }
}
