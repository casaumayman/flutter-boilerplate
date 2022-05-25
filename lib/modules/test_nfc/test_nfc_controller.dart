import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TestNFCController extends GetxController {
  var pin1 = "".obs;
  var pin2 = "".obs;
  var isLoading = false.obs;
  var data = "Scanned data here!".obs;
  final platform = MethodChannel("com.example.car_cleaning_demo_flutter.chanel");

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void submit() async {
    startLoading();
    try {
      var requestData = <String, String> {
        "pin1": pin1.value,
        "pin2": pin2.value
      };
      var dataRes = await platform.invokeMethod<String>("SCAN_NFC", requestData);
      print(dataRes);
      data.value = dataRes ?? "";
      stopLoading();
      return;
    } catch (error) {
      if (error is PlatformException) {
        print(error.message);
        data.value = "error: ${error.message}";
      } else {
        data.value = error.toString();
      }
      stopLoading();
      return;
    }
  }

}