import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Center(child: Text('Автор и Благодарности', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          SizedBox(height: 40),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
                          child: Container(
                height: 150,
                            child: Image(
                  image: NetworkImage('https://i.ibb.co/gjGC8gB/Whats-App-Image-2020-12-22-at-14-59-35.jpg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text("""Абылай Шынгыс:

 "Идея создания автоматизированной базы сортировки строительных и правил пришла во время стажировки в Проектной Академии "KAZGOR". На сегодняшний день сборник правил и норм представляет собой объемный файл, и повышает возможность некоторых упущений норм и правил, что естественно может привести к трагическим последствиям. Поэтому, я обнаружил необходимость внедрения автоматической сортировки. Выражаю благодарность ТОО "3-A Engineering" за организацию консультаций по концепции идеи и работы вебсайта 4Enginner" """, style: TextStyle(fontSize: 18)),
              ),
              SizedBox(width: 20),
              SizedBox(height: 200, width: 200, child: ClipRRect(
                              child: Image(
                  height: 200,width: 200,
                  image: NetworkImage('https://i.ibb.co/FzZhFp2/abyl.png'),
                ),
              )), 
            ],
          ),
        ],
      ),
    );
  }
}