import 'package:car_cleaning_demo/modules/plan/plan_controller.dart';
import 'package:get/get.dart';


class PlanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanController>(
          () => PlanController(),
    );
  }
}
