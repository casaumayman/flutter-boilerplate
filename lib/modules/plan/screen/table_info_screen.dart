import 'package:car_cleaning_demo/modules/plan/widget/table_info.dart';
import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableInfoScreen extends StatelessWidget {
   TableInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.AppBarUI(title: "予約を確定する"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableInfo(),
          ),
          CommonWidget.rowHeight30(),
          ButtonUI(text: "予約確定", textColor: white, width: 150.0, buttonColor: red, onPressed: (){
            Get.back();
          }),
          CommonWidget.rowHeight5(),
          ButtonUI(text: "キャンセル", textColor: black50, width: 150.0, buttonColor: grey, onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return showDialogCf(context);
              },
            );
          }),
        ],
      ),
    );
  }
  AlertDialog showDialogCf(context){
    return AlertDialog(
      title: CommonWidget.TextUI(text: "予約を削除しますか"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CommonWidget.TextUI(text: "削除",color: green)),
            CommonWidget.rowWidth15(),
            InkWell(
                onTap: (){
                  Get.toNamed(Routes.CALENDAR_HOME);
                },
                child: CommonWidget.TextUI(text: "キャンセル",color: green))
          ],
        )
      ],
    );
  }

}
