import 'package:car_cleaning_demo/modules/calendar/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarHome extends StatefulWidget {
  const CalendarHome({Key? key}) : super(key: key);

  @override
  State<CalendarHome> createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {

  static const CHANNEL = "com.example.car_cleaning_demo_flutter";
  static const KEY_NATIVE = "showNativeView";
  // final CalendarController controller = Get.arguments;
  CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network("https://automobilebabe.com/wp-content/uploads/2021/06/12.jpg"),
              Text(
                "水なし洗車（仮",
                style: TextStyle(color: Color(0xfff9c104), fontSize: 30.0),
              )
            ],
          ),
          Container(
            width: width,
            decoration: borderBox(),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                      ),
                    ),
                    Container(
                        child: buildBigText("予約する")
                    ),
                    Expanded(
                      child: Container(
                         child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ],
                ),
                buildLine(width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                        child: buildBigText("予約する")),
                    buildBoxText()
                  ],
                ),
                buildLine(width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: buildBigText("お知らせ")),
                    buildNewsBox()
                  ],
                ),
                buildLine(width),
                buildExplain(),
                buildLine(width),
                buildBigText("アプリの使い方ガイド")
              ],
            )
          )
        ],
      ),
    );
  }

  Widget buildLine(width){
    return Container(
      width: width,
      height: 2.0,
      decoration: borderBox()
    );
  }
  Widget buildBigText(text){
    return Text(text,style: TextStyle(fontSize: 30),);
  }
  buildBoxText(){
     return Container(
       margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10.0),
       padding: EdgeInsets.only(top: 20.0,bottom: 20.0,right: 30.0,left: 30.0),
       decoration: BoxDecoration(
         color: Color(0xff94c476),
           border: Border.all(
             color:Color(0xff357ecd),
             width: 1,
             
           ),
         borderRadius: BorderRadius.circular(8.0)
       ),
       child: InkWell(
         onTap: (){
          controller.showNativeView();
         },
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("11/3(金)"),
             Text("17:00-17:30"),
           ],
         ),
       ),
     );
  }
  borderBox(){
    return BoxDecoration(
        border: Border.all(
          color:Color(0xff94c476),
          width: 2,
        )
    );
  }
  Widget buildNewsBox(){
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10.0),
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20.0,left: 20.0),
      decoration: BoxDecoration(
          color: Color(0xffa1bceb),
          border: Border.all(
            color:Color(0xff357ecd),
            width: 1,

          ),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Center(
        child: Text("初回クーポン配布！！"),
      ),
    );
  }
  Widget buildExplain(){
    return Column(
      children: [
        Text("水なし洗車とは？",style: TextStyle(fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/explain_1.png'),
            Image.asset('assets/images/explain_2.png'),
            Image.asset('assets/images/explain_3.png'),
          ],
        )
      ],
    );
  }

}