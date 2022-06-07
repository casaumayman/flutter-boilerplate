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
     if (listRowRandom.contains(index) && listCellActive[index] == indexCell) {
       disable =true;
     }
     return disable;
     update();
   }
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


  void randomListItem() {
    for(int i=0;i<3;i++){
      listRowRandom[i]=random.nextInt(listDataTable.length-1);
    }
      print("Random "+listRowRandom.toString());

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

      if(isClick==true){
        for(int i=0;i<listIndexCell.length;i++){
          if(listIndexCell[i]==randomIndex1){

          }
        }
      }


      return color;

   }

}