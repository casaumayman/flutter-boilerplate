import 'package:car_cleaning_demo/modules/test_nfc/test_nfc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestNFCScreen extends GetView<TestNFCController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Obx(() => Scaffold(
              body: controller.isLoading.isTrue
                  ? Stack(
                      children: [
                        Opacity(
                            opacity: 0.2,
                            child: Center(
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
                                        decoration: InputDecoration(
                                            labelText: "PIN 1",
                                            border: OutlineInputBorder()),
                                      ),
                                      margin:
                                          EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "PIN 2",
                                            border: OutlineInputBorder()),
                                      ),
                                      margin:
                                          EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Start scan NFC")),
                                  ],
                                )),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ))),
                        Center(child: CircularProgressIndicator())
                      ],
                    )
                  : Center(
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
                                onPressed: controller.submit,
                                child: Text("Start scan NFC")),
                          ],
                        )),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    )),
              appBar: AppBar(
                title: Text("Test NFC Reader"),
              ),
            )));
  }
}
