import 'dart:convert';

import 'package:car_cleaning_demo/shared/constants/progress_dialog.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConfirmInfoController extends GetxController{
  var pin1 = "".obs;
  var pin2 = "".obs;
  var isLoading = false.obs;
  var data = "".obs;
  var errorValue="".obs;

  final platform = MethodChannel("com.example.car_cleaning_demo_flutter.chanel");
  var edtPin=TextEditingController();
  var edtName=TextEditingController();
  var edtBirtday=TextEditingController();
  var edtAddress=TextEditingController();
  var edtEmail=TextEditingController();

  void funLogin(){
    startLoading();
    CommonWidget.toast(isLoading.toString());
    for(int i=0;i<10000;i++){
      print(i.toString());
    }
    stopLoading();
  }

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }
  void setNoErr(){
    errorValue.value="";
    update();
  }

  void scanNfcSubmit(context) async {
    var dialog=dialogLoading(context,"Loading...");
    await dialog.show();
    startLoading();
    try {
      var requestData = <String, String> {
        "pin1": edtPin.text,
        "pin2": "",
      };
      var dataRes = await platform.invokeMethod<String>("SCAN_NFC", requestData);
      // print("data $dataRes + ${dataRes?.length.toString()}");

       data.value = dataRes ?? "No data";
      if(data.value!=null && data.value!="{}"&& data.value!=""){
        var dataHashMap=jsonDecode( data.value);
        edtName.text=dataHashMap["name"];
        edtBirtday.text=dataHashMap["birthDate"];
        edtAddress.text=dataHashMap["address"];
      }
      stopLoading();
      await dialog.hide();
      return;
    } catch (error) {
      if (error is PlatformException) {

        data.value = "error: ${error.message}";
        print("Value  ${error.message}");
        if(error.message=="This devide no suport nfc"){
           errorValue.value="This devide no suport nfc";
           update();
        }
      } else {

        data.value = error.toString();
      }
      await dialog.hide();
      stopLoading();
      return;
    }
  }

}