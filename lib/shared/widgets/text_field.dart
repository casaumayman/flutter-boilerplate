import 'package:bluetooth_app/shared/utils/color.dart';
import 'package:bluetooth_app/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';

class TextFieldUI extends StatelessWidget {
   TextFieldUI({Key? key,
     this.controller,
     this.textInputType,
     required this.hintText,
     required this.labelText,
     this.maxLine=1,
     this.obscureText=false,
     this.enable=true,
     required this.borderColor,
     required this.spaceLabelTextField, this.initialValue="",this.onchange}) : super(key: key);
  Color borderColor;
  String hintText;
  String labelText;
  int? maxLine;
  double spaceLabelTextField;
  String initialValue;
  ValueChanged<String>? onchange;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool obscureText;
  bool enable;


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonWidget.TextUI(text: labelText),
        SizedBox(height: spaceLabelTextField,),
        TextFormField(
          controller: controller,
          obscureText: this.obscureText,
          maxLines: maxLine,
          onChanged:onchange,
          enabled: this.enable,

          textAlignVertical: TextAlignVertical.center,
          keyboardType:textInputType,
          autocorrect: true,
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0,color: black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: grey,fontSize: 20.0,),
            fillColor: white,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: borderColor),
            ),
          ),),
      ],
    );
  }
}
