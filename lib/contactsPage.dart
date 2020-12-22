import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Center(
            child: Text('Контакты',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Center(
            child: Text('При обнаружений проблем, системных ошибок и неточностей, свяжитесь с нами по нижеуказанной электронной почте, точно описывая суть проблемы. Мы учтем ваши пожелания и комментарий в ходе дальнейшего обновления и развития проекта. Спасибо.', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 20),
          Center(
            child: Text('shynggysov.abylai@gmail.com', style: TextStyle(fontSize: 18, color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}