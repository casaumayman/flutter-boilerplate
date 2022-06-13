import 'package:car_cleaning_demo/calendar_api//api.dart';
import 'package:get/get.dart';


class UserBaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addAuthenticator(UserInterceptor);
    httpClient.addRequestModifier(UserRequestInterceptor);
    httpClient.addResponseModifier(UserResponseInterceptor);
  }
}
