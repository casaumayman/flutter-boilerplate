

import 'package:flutter/material.dart';
class TablePlan extends StatefulWidget {
  const TablePlan({Key? key}) : super(key: key);

  @override
  _TablePlanState createState() => _TablePlanState();
}
List<String> list= [
  '7:00',
  '8:00',
  '9:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
];
List<String> active=[];
List<int> listIndex=[];
List cellListAc=List.filled(list.length, {});


class _TablePlanState extends State<TablePlan> {
  int index=0;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("お手軽洗車", "500円"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("しっかり洗車", "700円"),
              _buidBorderTable(width: double.infinity),
              _buildTitlePlan("スぺシャル洗車", "1000円"),
              _buidBorderTable(width: double.infinity),
            ],
          ),
        ),
        Expanded(
          flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  Row(
                children: [
                  for (int i=0; i<list.length; i++)
                    _buidColumn(list[i], list[i], list[i], i)

                ],
              ),
            )

        )

      ],
    );
  }



  Widget _buildCell(text,index,icell,active){
    // print("render : "+isActive);
    return Container(
        width: 70.0,
        height: 50,
        decoration: BoxDecoration(
          color:setColor(index, icell,active:active ),
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.blue),
            right: BorderSide(width: 0.5, color: Colors.blue),
          ),

        ),
        child: Center(child: Text("$text",style: TextStyle(fontSize:16.0,color: Colors.black),textAlign: TextAlign.center,)));

  }
  Widget _buidColumn(text1,text2,text3,index){
    print("cellIndex ${cellListAc[index]}");
    return Column(
      children: [
        _buidBorderTable(),
        AbsorbPointer(
          absorbing:false,
          // absorbing: isActive1=="ac"?true:false,
          child: InkWell(
            onTap: (){
              setState(() {
                cellListAc[index]=0;
                this.index=index;
                if(listIndex.contains(index)){
                  listIndex.remove(index);
                }else{
                  listIndex.add(index);
                }


              });
            },
              child: _buildCell(text1,index,0,true)),
        ),
        _buidBorderTable(),
        AbsorbPointer(
          absorbing:false,
          // absorbing: isActive2=="ac"?true:false,
          child: InkWell(
              onTap: (){
                setState(() {
                  this.index=index;
                  cellListAc[index]=1;
                  if(listIndex.contains(index)){
                    listIndex.remove(index);
                  }else{
                    listIndex.add(index);
                  }
                  print(index.toString());
                });
              },
              child: _buildCell(text2,index,1,true)),
        ),
        _buidBorderTable(),
        AbsorbPointer(
          absorbing: false,
          // absorbing: isActive3=="ac"?true:false,
          child: InkWell(
              onTap: (){
                setState(() {
                  this.index=index;
                  cellListAc[index]=2;
                  if(listIndex.contains(index)){
                    listIndex.remove(index);
                  }else{
                    listIndex.add(index);
                  }
                  print(index.toString());
                });
              },
              child: _buildCell(text3,index,2,true)),
        ),
        _buidBorderTable(),

      ],
    );
  }
  bool setDisable(cellListAc,index){
    if(cellListAc[index]!={}&&cellListAc[index]!=index){
      return false;
    }
    return true;
  }
  Color setColor(index,icell,{active=true}){
    Color color=active==true?Colors.white:Colors.black45;
    if(listIndex.contains(index) && cellListAc[index]==icell){
      color=Colors.yellow;
    }else if(listIndex.contains(index)&& cellListAc[index]!=icell ){
      color=Colors.black45;
    }
    // else{
    //   color=Colors.black45;
    // }
    return color;
  }

  Widget _buildTitlePlan(text,textPrice){
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff60c3ed),
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.blue),
            right: BorderSide(width: 0.5, color: Colors.blue),
          ),

        ),

        child: Center(child: Column(
          children: [
            Text(text,style: TextStyle(fontSize:16.0,color: Colors.black),textAlign: TextAlign.center,),
            Text(textPrice,style: TextStyle(fontSize:16.0,color: Colors.redAccent),textAlign: TextAlign.center,),
          ],
        )
        )
    );

  }

  Widget _buidBorderTable({width=70.0}){
    return  Container(width: width,height: 0.5,color: Colors.blue,);

  }

}

