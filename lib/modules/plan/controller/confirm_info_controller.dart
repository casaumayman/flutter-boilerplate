import 'dart:convert';

import 'package:car_cleaning_demo/calendar_api/api_repository.dart';
import 'package:car_cleaning_demo/models/user/UserRequest.dart';
import 'package:car_cleaning_demo/models/user/UserResponse.dart';
import 'package:car_cleaning_demo/routes/app_pages.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConfirmInfoController extends GetxController {
  final UserApiRepository apiRepository;

  ConfirmInfoController({required this.apiRepository});

  final TAG = "NFC";
  var isLoading = false;
  var data = "".obs;
  var errorValue = "".obs;
  var checkboxOne = false;
  var checkboxTwo = false;
  var userId;

  final platform =
      MethodChannel("com.example.car_cleaning_demo_flutter.chanel");
  var edtPin = TextEditingController();
  var edtName = TextEditingController();
  var edtBirthday = TextEditingController();
  var edtAddress = TextEditingController();
  var edtEmail = TextEditingController();

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  void dismissErrorDialog() {
    errorValue.value = "";
    update();
  }

  bool getCheckBoxOne(bool checkBoxOne) {
    update();
    return this.checkboxOne = checkBoxOne;
  }

  bool getCheckBoxTwo(bool checkBoxTwo) {
    update();
    return this.checkboxTwo = checkBoxTwo;
  }

  void register() async {
    if(isValidate()==true){
      startLoading();
      try{
        var userResponse = await apiRepository.register(
          UserRequest(
            name: edtName.text,
            username: edtName.text,
            email: edtEmail.text,
          ),
        );
        stopLoading();
        Get.toNamed(Routes.TABLE_INFO_SCREEN, arguments: [userResponse!.id,userResponse.email] );
      }catch(e){
        stopLoading();
        CommonWidget.toast("Đã có lỗi xảy ra...");
      }
    }

  }

  bool isValidate() {
    if (edtName.text == "") {
      CommonWidget.toast("Please ! Enter your name");
      return false;
    }
    else if (edtBirthday.text == "") {
      CommonWidget.toast("Please ! Enter your birthday");
      return false;
    }
    else if (edtAddress.text == "") {
      CommonWidget.toast("Please ! Enter your address");
      return false;
    } else if (edtEmail.text == "") {
      CommonWidget.toast("Please ! Enter your email");
      return false;
    } else if (!Regex.isEmail(edtEmail.text)) {
      CommonWidget.toast("Email not must format");
      return false;
    }
      return true;

  }

  void scanNfcSubmit(context) async {
    if (edtPin.text == "") {
      CommonWidget.toast("Please ! Enter your pin code");
      return;
    } else if (edtPin.text.length != 4) {
      CommonWidget.toast("Pin code  4 number");
      return;
    }
    startLoading();
    try {
      var requestData = <String, String>{
        "pin1": edtPin.text,
        "pin2": "",
      };
      var dataRes =
          await platform.invokeMethod<String>("SCAN_NFC", requestData);

      data.value = dataRes ?? "No data";
      if (data.value != null && data.value != "{}" && data.value != "") {
        var dataHashMap = jsonDecode(data.value);
        userId = dataHashMap['licenseNumber'];
        edtName.text = dataHashMap["name"];
        edtBirthday.text = dataHashMap["birthDate"];
        edtAddress.text = dataHashMap["address"];
      }
      stopLoading();

      return;
    } catch (error) {
      if (error is PlatformException) {
        // data.value = "error: ${error.message}";
        if (error.message == "This devide no suport nfc") {
          errorValue.value = "This devide no suport nfc";
          update();
        }
      } else {
        errorValue.value = "No can't scan data";
        print("$TAG :" + data.value);
        update();
        // data.value = error.toString();
      }
      stopLoading();
      return;
    }
  }

  @override
  onClose() {
    super.onClose();
    edtName.dispose();
    edtPin.dispose();
    edtBirthday.dispose();
    edtAddress.dispose();
    edtEmail.dispose();
  }
}
