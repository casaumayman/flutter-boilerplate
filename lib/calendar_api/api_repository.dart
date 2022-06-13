import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:car_cleaning_demo/models/user.dart';
import 'package:car_cleaning_demo/models/user/UserRequest.dart';
import 'package:car_cleaning_demo/models/user/UserResponse.dart';
import 'package:car_cleaning_demo/models/user/user_id.dart';

import 'api.dart';

class UserApiRepository {
  UserApiRepository({required this.apiProvider});

  final UserApiProvider apiProvider;

  Future<UserResponse?> register(UserRequest data) async {
    final res = await apiProvider.register('/auth/register', data);
    print("res: ${res.body}");
    if (res.statusCode == 200) {
      return UserResponse.fromJson(res.body);
    }

  }

  Future<UserID?> sendEmail(UserID userId)async{
    print("userId   ${userId.userId}" );
    final res = await apiProvider.sendEmail('/reserve', userId);

    if(res.statusCode==200){
       return UserID.fromJson(res.body);
    }
  }


}
