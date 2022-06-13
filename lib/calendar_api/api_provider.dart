import 'dart:ffi';

import 'package:car_cleaning_demo/api/base_provider.dart';
import 'package:car_cleaning_demo/calendar_api/base_provider.dart';
import 'package:car_cleaning_demo/models/models.dart';
import 'package:car_cleaning_demo/models/user.dart';
import 'package:car_cleaning_demo/models/user/UserRequest.dart';
import 'package:car_cleaning_demo/models/user/UserResponse.dart';
import 'package:car_cleaning_demo/models/user/user_id.dart';
import 'package:get/get.dart';

class UserApiProvider extends UserBaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, UserRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> sendEmail(String path,UserID userId){
     return post(path, userId.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }

  Future<Response>  getApi(String url){
    return get(url );

  }


}
