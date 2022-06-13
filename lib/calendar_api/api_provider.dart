import 'package:car_cleaning_demo/api/base_provider.dart';
import 'package:car_cleaning_demo/calendar_api/base_provider.dart';
import 'package:car_cleaning_demo/models/models.dart';
import 'package:car_cleaning_demo/models/user.dart';
import 'package:get/get.dart';

class UserApiProvider extends UserBaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }

    getApi(String url){
    return get(url);
  }


}
