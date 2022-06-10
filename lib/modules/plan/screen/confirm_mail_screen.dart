import 'package:car_cleaning_demo/routes/app_pages.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ConfirmMailScreen extends StatelessWidget {
  const ConfirmMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.AppBarUI(title: "Email"),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CommonWidget.TextUI(text: " 予約に成功しました。確認メールはexample@gmail.comに送信されました。",
              fontSize: 18,
            ),
            ButtonUI(text: "Home",  width: 200.0, onPressed: (){Get.to(Routes.CALENDAR_HOME);})
          ],
        ),
      ),
    );
  }
}
