import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:flutter/material.dart';

class TableInfo extends StatelessWidget {
  const TableInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("予約日"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("予約時間"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("洗車場所"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("メニュー"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("料金"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("支払方法"),
              _buidBorderTable(width: double.infinity),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("11月3日(金)", ),
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("17:00-18:00",),
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("---",),
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("しっかり洗車コース, 車内清掃",),
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("5000円",visibility: false),
              _buidBorderTable(width: double.infinity),
              _buildContentPlan("カード払い", ),
              _buidBorderTable(width: double.infinity),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCell(text, textButton, VoidCallback onPresss) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: 70.0,
          height: 50,
          decoration: BoxDecoration(
            color: white,
            border: Border(
              left: BorderSide(width: 0.5, color: Colors.blue),
              right: BorderSide(width: 0.5, color: Colors.blue),
            ),
          ),
          child: Row(
            children: [
              CommonWidget.TextUI(text: text,fontSize: 13.0,color: black50),
              ButtonUI(
                  text: textButton,
                  textColor: white,
                  width: 70,
                  buttonColor: blue50,
                  onPressed: onPresss)
            ],
          )),
    );
  }



  Widget _buildTitlePlan(text) {
    return Container(
        height: 55,
        decoration: BoxDecoration(
          color: blue30,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.blue),
            right: BorderSide(width: 0.5, color: Colors.blue),
          ),
        ),
        child: Center(
          child: CommonWidget.TextUI(text: text,fontSize: 13.0,color: black)
        ));
  }

  Widget _buildContentPlan(text,{visibility=true}) {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.blue),
            right: BorderSide(width: 0.5, color: Colors.blue),
          ),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: CommonWidget.TextUI(text: text,color: black50,fontSize: 13.0),
            ),
            Visibility(
              visible:visibility ,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ButtonUI(text: "変更", textColor: white, width: 60.0, buttonColor: blue50, onPressed: (){}),
                ))
          ],
        ));
  }

  Widget _buidBorderTable({width = 70.0}) {
    return Container(
      width: width,
      height: 0.5,
      color: Colors.blue,
    );
  }


}
