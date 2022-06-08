import 'package:car_cleaning_demo/modules/plan/controller/select_plan_controller.dart';
import 'package:car_cleaning_demo/routes/routes.dart';
import 'package:car_cleaning_demo/shared/utils/color.dart';
import 'package:car_cleaning_demo/shared/utils/common_widget.dart';
import 'package:car_cleaning_demo/shared/widgets/button_ui.dart';
import 'package:car_cleaning_demo/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../models/plan_table_model.dart';


class SelectPlanScreen extends GetView<SelectPlanCotroller> {
   SelectPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonWidget.AppBarUI(title: "メニュー選択"),
      body:GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetBuilder<SelectPlanCotroller>(
          initState: (state) { controller.initData() ;},
          builder: (_) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SfDataGridTheme(
                        data: SfDataGridThemeData(
                            gridLineColor: blue50, gridLineStrokeWidth: 1.0,
                            headerColor: blue40),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          child: SfDataGrid(
                            source: controller.productDataSource,
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            columns: <GridColumn>[
                              GridColumn(
                                  columnName: 'プラン',
                                  width: width*0.27,
                                  label: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                                      alignment: Alignment.center,
                                      child: CommonWidget.TextUI(text: 'プラン',fontSize: 13.0)
                                  )
                              ),
                              GridColumn(
                                  columnName: '説明',
                                  width: width*0.27,
                                  label: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                                      alignment: Alignment.center,
                                      child: CommonWidget.TextUI(text:"説明",fontSize: 13.0))),
                              GridColumn(
                                  columnName: '金額',
                                  width: width*0.27,
                                  label: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.center,
                                      child: CommonWidget.TextUI(text: '金額',fontSize: 13.0))),
                              GridColumn(
                                  columnName: 'isAvailble',
                                  width: width*0.19,
                                  label: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                                    alignment: Alignment.center,
                                    child: Text(''),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: CommonWidget.TextUI(text: "サービス料: ${controller.priceTotal}円",fontSize: 20.0)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextFieldUI(hintText: "ご要望",labelText: "",  maxLine: 3, borderColor: green,spaceLabelTextField: 0.0),
                      )
                    ],
                  ),
                ),
              ),
              Container(
               margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   ButtonUI(text: "戻る", textColor: white,buttonColor: blue50,width: 70.0, onPressed: (){
                     Get.back();
                   }),
                   ButtonUI(text: "次へ", textColor: white,buttonColor: blue50,width:  70.0, onPressed: (){
                     Get.toNamed(Routes.CONFIRM_INFO_SCREEN);
                   }),
                 ],
               ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class ProductDataSource extends DataGridSource {
  ProductDataSource({required this.employeeData}) {
    updateDataGridRow();
  }
  SelectPlanCotroller controller = Get.find();

  void updateDataGridRow() {
    _dataGridRow = employeeData.map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'プラン', value: e.name),
      DataGridCell<String>(columnName: '説明', value: e.product),
      DataGridCell<String>(columnName: '金額', value: e.price),
      DataGridCell(columnName: 'isCheck', value: e.isCheck)
    ])).toList();

  }

  List<DataGridRow> _dataGridRow = [];
  List<PlanTableModel> employeeData = [];

  @override
  List<DataGridRow> get rows => _dataGridRow;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: CommonWidget.TextUI(text:row.getCells()[0].value.toString(),fontSize: 13.0),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: CommonWidget.TextUI(text:row.getCells()[1].value.toString(),fontSize: 13.0),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: CommonWidget.TextUI(text:row.getCells()[2].value.toString(),fontSize: 13.0),
      ),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Checkbox(
            activeColor: Colors.lightBlue,
            value: row.getCells()[3].value,
            onChanged: (value) {
              final index = _dataGridRow.indexOf(row);
              // employeeData[index].isAvailable = value!;
              String dataPrice = employeeData[index].price;
              controller.checkPrice(value, int.parse(dataPrice.substring(0,dataPrice.length-1)));
              // value==true?controller.priceTotal +=int.parse(dataPrice.substring(0,dataPrice.length-1)):controller.priceTotal -=int.parse(dataPrice.substring(0,dataPrice.length-1));
             // controller.getPrice();
              row.getCells()[3] =
                  DataGridCell(value: value, columnName: 'isCheck');
                   notifyDataSourceListeners(
                  rowColumnIndex: RowColumnIndex(index, 3));
            },
          ))
    ]);
  }
}
