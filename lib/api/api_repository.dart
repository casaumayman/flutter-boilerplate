import 'dart:async';
import 'package:car_cleaning_demo/models/models.dart';
import 'package:car_cleaning_demo/models/response/users_response.dart';
import 'package:car_cleaning_demo/models/user.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/api/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<UsersResponse?> getUsers() async {
    final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
    if (res.statusCode == 200) {
      return UsersResponse.fromJson(res.body);
    }
  }
  
  Future<User?> getApiUser()async{
    final res=await apiProvider.getApi("https://jsonplaceholder.typicode.com/users");
    if(res.status==200){
      return User.fromJson(res.body);
    }
  }
}
