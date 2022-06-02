import 'dart:math';

import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlanController extends GetxController{
   RxList active=[].obs;
   RxList listIndex=[].obs;
   List cellListAc=List.filled(listDataTable.length, {});
   Color color=Colors.white;




   void checkActive(int index,int indexCell){

     cellListAc[index] = indexCell;
     print("Cell lits index "+ cellListAc[index].toString());
     if (listIndex.contains(index)) {
       listIndex.remove(index);
     } else {
       listIndex.add(index);
     }
     print("lits index "+ listIndex.toString());
     update();
   }

   bool setActive(int index,int  indexCell){
     bool disable=false;
     if (listIndex.contains(index) && cellListAc[index] == indexCell) {
       disable =false;
     } else if (listIndex.contains(index) && cellListAc[index] != indexCell) {
       disable=true;
     }

     return disable;
     update();
   }

   Color setColor(int index,int indexCell){
      // Color color=active==true?Colors.white:Colors.black45;
     // Color color=Colors.white;
      if(listIndex.contains(index) && cellListAc[index]==indexCell){
         color=Colors.yellow;
      }
      else if(listIndex.contains(index)&& cellListAc[index]!=indexCell ){
         color=Colors.black45;
      }else{
        color=Colors.white;
      }
      return color;
      update();
   }

}