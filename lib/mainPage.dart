import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'auth.dart';
  String email;
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  void initState() {
    email = FirebaseAuth.instance.currentUser.email;
    if(mounted){
      setState((){});
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Center(child: Text('Миссия', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          SizedBox(height: 40),
          SizedBox(
                      child: IntrinsicHeight(
                                              child: Row(
              children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4Engineer:', style: TextStyle(fontSize: 20)), 
                    SizedBox(height: 10),
                    Text('Реализовать максимально эффективный метод сортировки строительных норм и правил. Уменьшить возможность упущений в разрезе человеческого фактора.', style: TextStyle(
                      fontSize: 18, 
                    )),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                    image: NetworkImage('https://vplate.ru/images/article/croppedtop/450-255/2019/11/arhitektor-inzhener-opisanie-professii-obyazannosti-i-trebovaniya.jpg'),
                  ),
                ),
              ),
              ],
            ),
                      ),
          ),
          SizedBox(height: 40),
                    Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Text('Добро пожаловать, ${email!=''?email:'loading...'}!', style: TextStyle(fontSize: 16,)),
              SizedBox(width: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AuthPage()));
              },
              child: Text('Выйти', style: TextStyle(fontSize: 12, color: Colors.red)))),
            ],
          ),
        ],
      ),
    );
  }
}