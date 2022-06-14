import 'package:bluetooth_app/calendar_api//api.dart';
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
