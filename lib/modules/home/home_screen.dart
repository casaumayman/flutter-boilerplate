import 'package:flutter/material.dart';
import 'package:car_cleaning_demo/modules/home/home.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("This is Json data ${controller.nfcJson}"),
          OutlinedButton(
              onPressed: () async {
                const platform = MethodChannel('scan_NFC');
                final String res =
                    await platform.invokeMethod("getNFCUserInfo", true);
                print(res);
              },
              child: Text(
                "Test NFC",
                style: TextStyle(fontSize: 20),
              ))
        ],
        mainAxisSize: MainAxisSize.min,
      )),
    );
  }
}
