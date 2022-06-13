import 'dart:math';

import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlanController extends GetxController{
   RxList active=[].obs;
   RxList listIndexCell=[].obs;
   List listCellActive=List.filled(listDataTable.length, {});
   Color colorTable=white;


   void checkActiveCalendar(int index,int indexCell){
     listCellActive[index] = indexCell;
     print("Cell lits index "+ listCellActive[index].toString());
     if (listIndexCell.contains(index)) {
       listIndexCell.remove(index);
     } else {
       listIndexCell.add(index);
     }
     print("lits index "+ listIndexCell.toString());

     update();

   }

   Color setColorCalendarClick(int index,int indexCell){
     // Color color=active==true?Colors.white:Colors.black45;
     Color color=Colors.white;
     if(listIndexCell.contains(index) && listCellActive[index]==indexCell){
       color=Colors.grey;
     }
     return color;
     update();
   }




   void checkActive(int indexCell,int indexRow){
     listCellActive[indexCell] = indexRow;
     print("listCellActive  ${listCellActive[indexCell] }" );
     if (listIndexCell.contains(indexCell)) {
       listIndexCell.remove(indexCell);
     } else {
       listIndexCell.add(indexCell);
     }
     update();

   }

   bool setActive(int indexCell,int  indexRow){
     bool disable=false;
     if (listIndexCell.contains(indexCell) && listCellActive[indexCell] == indexRow) {
       disable =false;
     } else if (listIndexCell.contains(indexCell) && listCellActive[indexCell] != indexRow) {
       disable=true;
     }



     return disable;
   }

   Color setColor(int indexCell,int indexRow){
      // Color color=active==true?Colors.white:Colors.black45;
     Color color=Colors.white;
      if(listIndexCell.contains(indexCell) && listCellActive[indexCell]==indexRow){
         color=Colors.yellow;
      }
      else if(listIndexCell.contains(indexCell)&& listCellActive[indexCell]!=indexRow ){
         color=Colors.black45;
      }else{
        color=Colors.white;
      }




      return color;

   }

}