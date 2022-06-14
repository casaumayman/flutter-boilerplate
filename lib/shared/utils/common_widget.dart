import 'package:bluetooth_app/shared/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonWidget {
  static AppBar appBar(
      BuildContext context, String title, IconData? backIcon, Color color,
      {void Function()? callback}) {
    return AppBar(
      leading: backIcon == null
          ? null
          : IconButton(
              icon: Icon(backIcon, color: color),
              onPressed: () {
                if (callback != null) {
                  callback();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: color, fontFamily: 'Rubik'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static Widget TextUI({String text="",double fontSize= 18.0,Color color=black}){
    return Text(text,style: TextStyle(fontSize: fontSize,color:color,fontWeight: FontWeight.normal ),);
  }
  static AppBar AppBarUI({String title="",Color titleColor:black,double fontSize=30.0,Color backgroundColor:grey}){
    return AppBar(
      title: TextUI(text: title,fontSize: fontSize,color: titleColor),
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
    );
  }

  static SizedBox rowHeight5({double height =5}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight10({double height = 10}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight15({double height = 15}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight20({double height = 20}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight25({double height = 25}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight30({double height = 30}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight35({double height = 35}) {
    return SizedBox(height: height);
  }
  static SizedBox rowHeight40({double height = 40}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth5({double width = 5}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth10({double width = 10}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth15({double width = 15}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth20({double width = 20}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth25({double width = 25}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth30({double width = 30}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth35({double width = 35}) {
    return SizedBox(width: width);
  }
  static SizedBox rowWidth40({double width = 40}) {
    return SizedBox(width: width);
  }

  static void toast(String msg) async {
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
