import 'package:car_cleaning_demo/modules/plan/plan.dart';
import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:car_cleaning_demo/shared/shared.dart';
import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:car_cleaning_demo/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmInfoScreen extends StatelessWidget {
  const ConfirmInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=SizeConfig().width(context);
    double height=SizeConfig().heigth(context);

    return Scaffold(
      appBar: CommonWidget.AppBarUI(title: "お客様情報入力"),
      body: GetBuilder<ConfirmInfoController>(
      builder: (controller) =>
      Stack(
        children: [
          Opacity(
            opacity: controller.errorValue!=""?0.4:1,

            child: SingleChildScrollView(
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

                      onchange: (value){
                        controller.pin1.value = value;
                      },
                    ),

                    CommonWidget.rowHeight10(),
                    Center(child: ButtonUI(text: "NFCの情報を利用する", textColor: black, width: 240.0, buttonColor: orange, onPressed: (){
                      // controller.isLoading.isFalse?pr.hide():pr.show();
                      controller.scanNfcSubmit(context);
                      // print(controller.isLoading.value);
                      // print(controller.pin1.value);
                    })),
                    CommonWidget.rowHeight20(),
                    //name
                    TextFieldUI(
                        controller: controller.edtName,
                        hintText: "",
                        labelText: "名前",
                        borderColor: blue50,spaceLabelTextField: 10.0),
                    CommonWidget.rowHeight20(),
                    // birthDay
                    TextFieldUI(
                        controller: controller.edtBirtday,
                        hintText: "", labelText: "お誕生日",  borderColor: blue50,spaceLabelTextField: 10.0),
                    CommonWidget.rowHeight20(),
                    //address
                    TextFieldUI(
                        controller: controller.edtAddress,
                        hintText: "", labelText: "住所",  borderColor: blue50,spaceLabelTextField: 10.0),
                    CommonWidget.rowHeight20(),
                    // email
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
          ),
         controller.errorValue!=""? Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: 200.0,
              color: white,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // The loading indicator
                  CommonWidget.TextUI(text: "Warning",fontSize: 18.0,color:yellow ),
                  CommonWidget.rowHeight15(),
                  CommonWidget.TextUI(text: '${controller.errorValue.value}',fontSize: 15.0),
                  CommonWidget.rowHeight15(),
                  ButtonUI(text: "Close",
                      textColor: white, width:
                      width, buttonColor: green,
                      onPressed: (){
                    controller.setNoErr();
                  })
                ],
              ),
            ),
          ):Container()
        ],
      ),
      )
    );
  }
}
