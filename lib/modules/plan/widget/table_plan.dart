import 'package:car_cleaning_demo/modules/plan/plan_controller.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/utils/data_table.dart';

class TablePlanUi extends StatelessWidget  {

   TablePlanUi( {Key? key}) : super(key: key);
   PlanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("お手軽洗車", "500円"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("しっかり洗車", "700円"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("スぺシャル洗車", "1000円"),
              _buidBorderTable(width: double.infinity),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < listDataTable.length; i++)
                    _buidColumn(listDataTable[i], listDataTable[i], listDataTable[i], i)
                ],
              ),
            ))
      ],
    );

  }
  Widget _buildCell(text, index, indexCell) {
    return AbsorbPointer(
      absorbing: controller.setActive(index, indexCell),
      child: InkWell(
        onTap: () {
          controller.checkActive(index, indexCell);
          print("index  $index --- indexCell $indexCell");
        },
        child: Container(
            width: 70.0,
            height: 50,
            decoration: BoxDecoration(
              color: controller.setColor(index, indexCell),
              border: Border(
                left: BorderSide(width: 0.5, color: Colors.blue),
                right: BorderSide(width: 0.5, color: Colors.blue),
              ),
            ),
            child: Center(
                child:CommonWidget.TextUI(text: text,fontSize: 15.0)
              )),
      ),
    );
  }

  Widget _buidColumn(text1, text2, text3, index) {
    return Column(
      children: [
        _buidBorderTable(),
        _buildCell(text1, index, 0,),
        _buidBorderTable(),
        _buildCell(text2, index, 1),
        _buidBorderTable(),
        _buildCell(text2, index, 2),
        _buidBorderTable(),
      ],
    );
  }


  Widget _buildTitlePlan(text, textPrice) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff60c3ed),
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.blue),
            right: BorderSide(width: 0.5, color: Colors.blue),
          ),
        ),
        child: Center(
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  textPrice,
                  style: TextStyle(fontSize: 16.0, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }

  Widget _buidBorderTable({width = 70.0}) {
    return Container(
      width: width,
      height: 0.5,
      color: Colors.blue,
    );
  }

}
