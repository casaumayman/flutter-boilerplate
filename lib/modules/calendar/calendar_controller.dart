import 'dart:ffi';

import 'package:car_cleaning_demo/shared/utils/constains.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  static const platform = MethodChannel(Constrains.CHANNEL);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> showMyDialog(context, message,alertDialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  Future<Null> showNativeView() async {
    try {
      final res = await platform.invokeMethod<String>(Constrains.KEY_NATIVE, <String, String> {
        "pin1": "352445",
      });
      print("response from swift: ${res}");
    } on Exception catch (error) {
      print("error from swift ${error}");
    }
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "message":
        debugPrint(call.arguments);
        return Future.value("");
    }
  }

  Future<String> _getMessage() async {
    var sendMap = <String, dynamic>{
      'from': 'Brandon',
    };
    String? value;
    try {
      value = await platform.invokeMethod('getDataNfc', sendMap);
    } catch (e) {
      print(e);
    }

    return value!;
  }
}
