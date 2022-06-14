import 'dart:async';
import 'package:bluetooth_app/models/models.dart';
import 'package:bluetooth_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> UserResponseInterceptor(
    Request request, Response response) async {
   print("Status code ${response.statusCode}");
  if ((response.statusCode ?? 0) < 200 || (response.statusCode ?? 0) > 299) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error);
      break;
    default:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error);
      break;
  }
  return;
}
