import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  var areaTotal; 
  var areaFloor;
  var buildingHeight;
  var buildingMaxVisits;
  bool techFloorExists = true;
  var areaTechFloor; 
  bool basementFloorExists = true;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Center(
            child: Text('Введите данные здания',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              Container(
                width: 300,
                child: Column(
                  children: [
                    typeSelector(),
                    customInput('Общая площадь, м^2', areaTotal),
                    customInput('Площадь этажа, м^2', areaFloor), 
                    customInput('Высота здания, м', buildingHeight), 
                    customInput('Макс. Посещаемость', buildingMaxVisits), 
                  ],
                ),
              ),
              Container(
                width: 300, 
                child: Column(
                  children: [
                    defaultBoolInput('Наличие технического этажа', techFloorExists, (){setState((){});}),
                    techFloorExists?customInput('Площадь технического этажа, м^2', areaTechFloor):SizedBox.shrink(),
                    defaultBoolInput('Наличие подвала и/или цокольного этажа', basementFloorExists, (){setState((){});}),
                    SizedBox(height: 10),
                     Align(
            alignment:Alignment.centerRight, 
            child: Container(
              height: 35, 
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black12, 
                borderRadius: BorderRadius.circular(5), 
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: Text('Подтвердить'),
              ),
            ),
          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget typeSelector() {
  return Container(
    height: 40,
    width: 300,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.black, width: 1),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        hint: Text('Тип здания'),
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    ),
  );
}

Widget customInput(name, value) {
  return Column(
    children: [
      SizedBox(height: 10), 
      SizedBox(
        width: 300,
        child: Row(
          children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(name,
                        style: TextStyle(
                          fontSize: 18,
                        )))),
            SizedBox(width: 10),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                          child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Значение',
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    value = val;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget defaultBoolInput(name, value, onTap){
  return Column(
    children: [
       SizedBox(height: 10), 
      SizedBox(
        width: 300, 
        child: Row(
          children: [
            Expanded(
              child: Text(name, style: TextStyle(
                fontSize: 18, 
              )),
            ),
            SizedBox(width: 10),
            SizedBox(height: 35, width: 40, child: Checkbox(
              value: value, 
              onChanged: (val){
                value = val;
                onTap();
              },
            ),),
          ],
        ),
      ),
    ],
  );
}
