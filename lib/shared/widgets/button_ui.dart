import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';

class ButtonUI extends StatelessWidget {
  ButtonUI({Key? key,required this.text, this.textColor:white,required this.width,  this.buttonColor:blue50 ,required this.onPressed}) : super(key: key);
  VoidCallback onPressed;
  String text;
  Color textColor;
  Color buttonColor;
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ,
      height: 40.0,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          child:CommonWidget.TextUI(text: text,color:textColor,fontSize: 13.0 ) ),
    );
  }
}
