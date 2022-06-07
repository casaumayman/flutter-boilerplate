import 'package:car_cleaning_demo/modules/plan/controller/plan_controller.dart';
import 'package:car_cleaning_demo/modules/plan/widget/calendar_plan.dart';
import 'package:car_cleaning_demo/modules/plan/widget/table_plan.dart';
import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanScreen extends GetView<PlanController> {
  PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CommonWidget.AppBarUI(title:  "メニュー選択",),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<PlanController>(
                  builder: (s) =>Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CalendarPlan(),
                      Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xf000000),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "予約選択",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                      TablePlanUi(),
                      _buildNotePlan(),
                    ],
                  ),
                ),
              ),
            ),
            buildBottomButton(width)
          ],
        ));
  }

  Widget _buildNotePlan() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          _buildSubNote(Colors.white, "選択できる"),
          _buildSubNote(Colors.yellow, "選択された"),
          _buildSubNote(Colors.black45, "選択できない"),
        ],
      ),
    );
  }

  Widget _buildSubNote(color, content) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )),
        ),
        CommonWidget.rowWidth5(),
        Text(content),
        CommonWidget.rowWidth10(),
      ],
    );
  }

  Widget buildBottomButton(width) {
    return Column(
      children: [
        Container(
          color: Colors.lightBlueAccent,
          width: width,
          height: 40.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: CommonWidget.TextUI(text: "サポート",fontSize: 18.0,color: white)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonUI(text: "戻る", textColor: white, width: 65.0, buttonColor: blue50, onPressed: (){
                Get.back();
              }),
              ButtonUI(text: "次へ", textColor: white, width: 65.0, buttonColor: blue50, onPressed: (){
                Get.toNamed(Routes.SECLECT_PLAN_SCREEN);
              }),
            ],
          ),
        )
      ],
    );
  }
}
