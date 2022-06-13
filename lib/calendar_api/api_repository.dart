import 'dart:async';
import 'dart:convert';
import 'package:car_cleaning_demo/models/models.dart';
import 'package:car_cleaning_demo/models/response/users_response.dart';
import 'package:car_cleaning_demo/models/user.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'api.dart';

class UserApiRepository {
  UserApiRepository({required this.apiProvider});

  final UserApiProvider apiProvider;


  Future<List<User>?> getApiUser()async{
    final res=await apiProvider.getApi("/users");
    print("object ${res.body}");
    if(res.status==200){
      return res.body;
    }
  }


}
