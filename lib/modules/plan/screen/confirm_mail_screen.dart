import 'package:car_cleaning_demo/modules/plan/controller/confirm_info_mail_controller.dart';
import 'package:car_cleaning_demo/routes/app_pages.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmMailScreen extends GetView<ConfirmMailController> {
  const ConfirmMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.AppBarUI(title: "Email"),
        body: GetBuilder<ConfirmMailController>(
          initState: (S) {
            controller.getUserData();
          },
          builder: (_) =>
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CommonWidget.TextUI(
                      text: " 予約に成功しました。確認メールはexample@gmail.comに送信されました。",
                      fontSize: 18,
                    ),
                    ButtonUI(text: "Home", width: 200.0, onPressed: () {
                      Get.toNamed(Routes.CALENDAR_HOME);
                    }),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: controller.list.length,
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         Text("${controller.list[index].firstName}"),
                    //         Text("${controller.list[index].lastName}"),
                    //         Text("${controller.list[index].email}"),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
        )


    );
  }
}
