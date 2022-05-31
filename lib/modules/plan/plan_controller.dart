import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';


class PlanController extends GetxController{
   RxList active=[].obs;
   RxList listIndex=[].obs;
   List cellListAc=List.filled(list.length, {});

   bool setActive(index, icell){
     bool disable=false;
     if (listIndex.contains(index) && cellListAc[index] == icell) {
       disable =false;
     } else if (listIndex.contains(index) && cellListAc[index] != icell) {
       disable=true;
     }

     return disable;
   }

   Color setColor(index,icell,{active=true}){
      Color color=active==true?Colors.white:Colors.black45;
      if(listIndex.contains(index) && cellListAc[index]==icell){
         color=Colors.yellow;
      }else if(listIndex.contains(index)&& cellListAc[index]!=icell ){
         color=Colors.black45;
      }
      return color;
   }

}