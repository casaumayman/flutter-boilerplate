import 'package:car_cleaning_demo/modules/test_nfc/test_nfc.dart';
import 'package:car_cleaning_demo/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestNFCScreen extends GetView<TestNFCController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Obx(() =>
            Scaffold(
              appBar: AppBar(
                title: Text("Test NFC Reader"),
              ),
              body: LoadingWidget(
                  isLoading: controller.isLoading.value,
                  message: "Xin mời đọc thẻ...",
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(controller.data.value),
                        ),
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  initialValue: controller.pin1.value,
                                  keyboardType: TextInputType.number,
                                  onChanged: (text) {
                                    controller.pin1.value = text;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "PIN 1",
                                      border: OutlineInputBorder()),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: controller.pin2.value,
                                  keyboardType: TextInputType.number,
                                  onChanged: (text) {
                                    controller.pin2.value = text;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "PIN 2",
                                      border: OutlineInputBorder()),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              ),
                              ElevatedButton(
                                  onPressed:(){
                                    controller.startLoading();
                                  },
                                  child: Text("Start scan NFC")),
                            ],
                          )),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )
              ),
            )
        ));
  }
}
