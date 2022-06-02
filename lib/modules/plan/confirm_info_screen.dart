import 'package:car_cleaning_demo/modules/plan/plan.dart';
import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:car_cleaning_demo/shared/constants/progress_dialog.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:car_cleaning_demo/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ConfirmInfoScreen extends StatelessWidget {
  const ConfirmInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=SizeConfig().width(context);
    double height=SizeConfig().heigth(context);
    ProgressDialog pr=  dialogLoading(context, "Đang đọc thẻ...");

    return Scaffold(
      appBar: CommonWidget.AppBarUI(title: "お客様情報入力"),
      body:
      GetBuilder<ConfirmInfoController>(
      builder: (controller) =>
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldUI(
                hintText: "",
                labelText: "PIN CODE",
                textInputType: TextInputType.number,
                borderColor: blue50,spaceLabelTextField: 10.0,
                value: controller.pin1.value,
                onchange: (value){
                  controller.pin1.value = value;
                },
              ),

              CommonWidget.rowHeight10(),
              Center(child: ButtonUI(text: "NFCの情報を利用する", textColor: black, width: 240.0, buttonColor: orange, onPressed: (){
                controller.isLoading.isFalse?pr.hide():pr.show();
                controller.funLogin();
                print(controller.isLoading.value);
                print(controller.pin1.value);
              })),
              CommonWidget.rowHeight20(),
              TextFieldUI(hintText: "", labelText: "名前",  borderColor: blue50,spaceLabelTextField: 10.0),
              CommonWidget.rowHeight20(),
              TextFieldUI(hintText: "", labelText: "お誕生日",  borderColor: blue50,spaceLabelTextField: 10.0),
              CommonWidget.rowHeight20(),
              TextFieldUI(hintText: "", labelText: "住所",  borderColor: blue50,spaceLabelTextField: 10.0),
              CommonWidget.rowHeight20(),
              TextFieldUI(hintText: "", labelText: "Eメール",  borderColor: blue50,spaceLabelTextField: 10.0),
              CommonWidget.rowHeight20(),
              ButtonUI(text: "洗車場所", textColor: white, width: 150.0, buttonColor: blue50, onPressed: (){}),
              TextFieldUI(hintText: "", labelText: "", borderColor: green,spaceLabelTextField: 0.0),
              Center(
                 child: Container(
                   width: width*0.5,
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Row(
                         children: [
                           Checkbox(
                             activeColor: blue50,
                               value:true, onChanged: (value){
                             value!=value;
                           }),
                           CommonWidget.TextUI(text: "立会いを希望する")
                         ],
                       ),
                       CommonWidget.rowHeight5(),
                       Row(
                         children: [
                           Checkbox(
                               activeColor: blue50,

                               value:true, onChanged: (value){
                             value!=value;
                           }),
                           CommonWidget.TextUI(text: "規約に同意する")
                         ],
                       )
                     ],
                   ),
                 ),
               ),              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonUI(text: "戻る", textColor: white,buttonColor: blue50,width: 100, onPressed: (){
                      Get.back();
                    }),
                    ButtonUI(text: "次へ", textColor: white,buttonColor: blue50,width: 100, onPressed: (
                        ){
                      Get.toNamed(Routes.TABLE_INFO_SCREEN);
                    }),
                  ],
                ),
              )




            ],
          ),
        ),
      ),
      )
    );
  }
}
