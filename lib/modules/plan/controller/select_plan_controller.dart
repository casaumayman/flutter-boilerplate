import 'package:car_cleaning_demo/modules/plan/screen/select_plan_screen.dart';
import 'package:get/get.dart';

import '../../../models/plan_table_model.dart';

class SelectPlanCotroller extends GetxController{
    List<PlanTableModel> employees = <PlanTableModel>[];
    late ProductDataSource productDataSource;
    var priceTotal=0;

    void initData(){
        employees = PlanTableModel.getEmployeeData();
        productDataSource = ProductDataSource(employeeData: employees);
    }

    int checkPrice(var isCheck, int price){
        if(isCheck==true){
            priceTotal+=price;
        }else{
            priceTotal-=price;
        }
        update();
        return priceTotal;

    }




}