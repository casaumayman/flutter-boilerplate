import 'package:car_cleaning_demo/calendar_api/api_repository.dart';
import 'package:car_cleaning_demo/models/user/user_id.dart';
import 'package:car_cleaning_demo/routes/app_pages.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:get/get.dart';

class TableInfoController extends GetxController{
  final userId=Get.arguments[0];
  final email=Get.arguments[1];
  final UserApiRepository apiRepository;
  var isLoading = false;

  TableInfoController({required this.apiRepository});

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }
     void sendMail(){
    startLoading();
       try{
         print("user id  "+userId.toString() );
           apiRepository.sendEmail(UserID(userId: userId));
         Get.toNamed(Routes.CONFIRM_MAIl_SCREEN,arguments: email);

         stopLoading();
       }catch(e){
         stopLoading();
         CommonWidget.toast("Đã có lỗi xảy ra");
       }
     }
}