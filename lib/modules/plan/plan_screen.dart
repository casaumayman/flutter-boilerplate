import 'package:car_cleaning_demo/modules/plan/widget/calendar.dart';
import 'package:flutter/material.dart';
import './widget/table.dart';



class PlanScreen extends StatelessWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("メニュー選択",style: TextStyle(color: Colors.black,fontSize: 30),),
          backgroundColor:  Color(0xFFD7D7D7)
          ,
          automaticallyImplyLeading: false,
        ),
        body:SingleChildScrollView(

          child: Column(
            children: [
              Calendar(),
              TablePlan()
            ],
          ),
        )
    );
  }
}
