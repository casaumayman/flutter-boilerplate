import 'dart:math';

import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlanController extends GetxController{
   RxList active=[].obs;
   RxList listIndex=[].obs;
   List cellListAc=List.filled(listDataTable.length, {});
   Color colorTable=white;



   List listRowRandom=List.filled(3, {});

   Random random = new Random();
   int indexRow=0;
   int indexCellDisable=0;

   int randomIndex1=0;
   int randomIndex2=0;
   int randomIndex3=0;
   bool isClick=false;
   void randomIndex(){
      randomIndex1=random.nextInt(4);
      randomIndex2=random.nextInt(4);
      randomIndex3=random.nextInt(4);

   }

   void calendarClick(){
     isClick=true;
     update();
   }

   void tableClick(){
     isClick=false;
     update();

   }
   bool setActiveCalendarClick(int index,int  indexCell){
     bool disable=false;
     if (listRowRandom.contains(index) && cellListAc[index] == indexCell) {
       disable =true;
     }

     return disable;
     update();
   }
   void checkActiveCalendar(int index,int indexCell){
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

   Color setColorCalendarClick(int index,int indexCell){
     // Color color=active==true?Colors.white:Colors.black45;
     Color color=Colors.white;
     if(listIndex.contains(index) && cellListAc[index]==indexCell){
       color=Colors.grey;
     }

     return color;
     update();
   }


  void randomListItem() {
    for(int i=0;i<3;i++){
      listRowRandom[i]=random.nextInt(listDataTable.length-1);
    }
      print("Random "+listRowRandom.toString());

   }




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
   }

   Color setColor(int index,int indexCell){
      // Color color=active==true?Colors.white:Colors.black45;
     Color color=Colors.white;
      if(listIndex.contains(index) && cellListAc[index]==indexCell){
         color=Colors.yellow;
      }
      else if(listIndex.contains(index)&& cellListAc[index]!=indexCell ){
         color=Colors.black45;
      }else{
        color=Colors.white;
      }
      return color;

   }

}