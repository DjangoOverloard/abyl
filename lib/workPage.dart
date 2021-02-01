import 'package:abyl/fetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


List<DocumentSnapshot> normDocs = [];

class WorkPage extends StatefulWidget {
  final VoidCallback openScaff;

  const WorkPage({Key key, this.openScaff}) : super(key: key);
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  bool loading;
  @override
  void initState() {
    super.initState();
  }

  fetch() {
    loading = true;
    setState(() {});
    fetchNorm(curValue, () {
      loading = false;
      setState(() {});
    });
  }

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
                child: typeSelector(() {
                  setState(() {});
                }),
              ),
              acceptButton(() {
                fetch();
              }, widget.openScaff),
            ],
          ),
          SizedBox(height: 20),
          Text(msg),
          SizedBox(height: 20),
          tableBuilder(loading, w)
        ],
      ),
    );
  }
}

String curValue = '';
Widget typeSelector(setst) {
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
        value: curValue != '' ? curValue : null,
        hint: Text('Тип здания'),
        items: <String>['Для всех', 'Ф1', 'Ф2', 'Ф3', 'Ф4', 'Ф5']
            .map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {
          curValue = _;
          setst();
        },
      ),
    ),
  );
}

Widget acceptButton(callBuild, openScaff) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        if (curValue != '') {
          callBuild();
        } else {
          openScaff();
        }
      },
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
  );
}

Widget tableBuilder(loading, w) {
  return Center(
      child: loading != null
          ? (loading
              ? Container(
                  height: 50, width: 50, child: CircularProgressIndicator())
              : Container(
                  child: Table(
                      border: TableBorder(
                          top: BorderSide(width: 1),
                          left: BorderSide(width: 1),
                          right: BorderSide(width: 1),
                          bottom: BorderSide(width: 1), horizontalInside: BorderSide(width: 1,), verticalInside: BorderSide(width:1)),
                      columnWidths: {1: FractionColumnWidth(0.95)},
                      children: List.generate(
                          normDocs.length,
                          (index) => TableRow(children: [
                                Padding(padding:EdgeInsets.all(8.0), child: Text('${index + 1}')),
                                Padding(padding:EdgeInsets.all(8.0), child: Text(normDocs[index].data()['norm']))
                              ]))),
                ))
          : SizedBox.shrink());
}

String msg = """Примечание для выбора типа здания: 
Ф1: Детские сады, дома престарелых и инвалидов, больницы, школы-интернаты, гостиницы, общежития, санаторий, многоквартирные жилые дома; 
Ф2: Театры, кинотеатры, концертные залы, клубы, спортивные сооружения, музеи, выставки, танцевальные залы; 
Ф3: Торговые дома, общественное питание, вокзалы, обслуживание;
Ф4: школы, высшие учебные заведения, офисы;
Ф5: Производственные здания, лабораторий; мастерские, склады, стоянки, хранилища для бумажных продуктов, сель. хоз. здания
 """;
