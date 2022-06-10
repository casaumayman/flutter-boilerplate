import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConfirmInfoController extends GetxController{
  var pin1 = "".obs;
  var isLoading = false;
  var data = "".obs;
  var errorValue="".obs;

  final platform = MethodChannel("com.example.car_cleaning_demo_flutter.chanel");
  var edtPin=TextEditingController();
  var edtName=TextEditingController();
  var edtBirthday=TextEditingController();
  var edtAddress=TextEditingController();
  var edtEmail=TextEditingController();


  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading= false;
    update();
  }
  void setNoErr(){
    errorValue.value="";
    update();
  }

  bool isValidate(){
    return true;
  }

  void scanNfcSubmit(context) async {

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
        edtBirthday.text=dataHashMap["birthDate"];
        edtAddress.text=dataHashMap["address"];
      }
      stopLoading();

      return;
    } catch (error) {
      if (error is PlatformException) {
        // data.value = "error: ${error.message}";
        if(error.message=="This devide no suport nfc"){
           errorValue.value="This devide no suport nfc";
           update();
        }
      } else {
        data.value = error.toString();
      }
      stopLoading();
      return;
    }
  }
  @override
  onClose(){
    super.onClose();
    edtName.dispose();
    edtPin.dispose();
    edtBirthday.dispose();
    edtAddress.dispose();
    edtEmail.dispose();
  }

}