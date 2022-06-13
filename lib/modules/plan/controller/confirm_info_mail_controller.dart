import 'dart:convert';

import 'package:car_cleaning_demo/api/api.dart';
import 'package:car_cleaning_demo/calendar_api/api_repository.dart';
import 'package:car_cleaning_demo/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../models/response/users_response.dart';

class ConfirmMailController extends GetxController {
  final UserApiRepository apiRepository;

  ConfirmMailController({required this.apiRepository});

  List<Datum> list = <Datum>[];
  List<User> listUser = <User>[];



  getUserData() async{
    final data=apiRepository.getApiUser();
    data.then((value) => {
       listUser!=value,
      print(listUser.length)
    });
  }
}