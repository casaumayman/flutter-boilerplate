import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog dialogLoading(context,msg){
  ProgressDialog pr = ProgressDialog(context);
  pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false,
    // customBody: LinearProgressIndicator(
    //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
    //   backgroundColor: Colors.white,
    // ),
  );
  pr.style(
      message: msg,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      // progressWidget: Container(
      //     padding: EdgeInsets.all(8.0),
      //   child: const CircularProgressIndicator(
      //
      //   ),
      // ),

      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,

      maxProgress: 100.0,
      textAlign: TextAlign.start,
      progressTextStyle:  TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle:  TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );


  return pr;
}