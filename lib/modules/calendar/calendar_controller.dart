import 'package:car_cleaning_demo/shared/utils/constains.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController{

  static const platform = MethodChannel(Constrains.CHANNEL);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  Future<void> showMyDialog(context,message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification has data'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text('This is data scan nfc'),
                Text(message,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close  '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<Null> showNativeView() async {

    await platform.invokeMethod(Constrains.KEY_NATIVE);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "message":
        debugPrint(call.arguments);
        return Future.value("");
    }
  }
  Future<String> _getMessage() async {
    var sendMap = <String, dynamic> {
      'from' : 'Brandon',
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