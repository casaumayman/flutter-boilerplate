import 'dart:ffi';

import 'package:bluetooth_app/api/base_provider.dart';
import 'package:bluetooth_app/calendar_api/base_provider.dart';
import 'package:bluetooth_app/models/models.dart';
import 'package:bluetooth_app/models/user.dart';
import 'package:bluetooth_app/models/user/UserRequest.dart';
import 'package:bluetooth_app/models/user/UserResponse.dart';
import 'package:bluetooth_app/models/user/user_id.dart';
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
