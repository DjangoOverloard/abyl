import 'package:abyl/creditPage.dart';
import 'package:abyl/workPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'contactsPage.dart';
import 'mainPage.dart';


int curPage = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey <ScaffoldState> scaff = new GlobalKey<ScaffoldState>();

  changePage(val){
    setState((){
      curPage = val;
      scaff.currentState.openEndDrawer();
    });
  }


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaff,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('4Engineer', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: w>500?[
          Row(
            children: [
              appBarButton('Главная Страница', () {changePage(0);}, 0),
              appBarButton('Приступить к работе', (){changePage(1);}, 1),
              appBarButton('Автор и Благодарности', () {changePage(2);}, 2),
              appBarButton('Контакты', () {changePage(3);}, 3),
            ],
          ),
        ]:[],
      ),
      drawer: w>500?null:Container(
        width: 300,
              child: Drawer(
          child: Column(
            children: [
                appBarButton('Главная Страница', () {changePage(0);},0,  size: 290),
                appBarButton('Приступить к работе', (){changePage(1);}, 1, size: 290),
                appBarButton('Автор и Благодарности', () {changePage(2);},2,  size: 290),
                appBarButton('Контакты', () {changePage(3);}, 3, size: 290),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
                child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: curPage == 0?MainPage():curPage == 1?WorkPage():curPage == 2?CreditPage():ContactsPage(),
          ),
        ),
      ),
    );
  }
}


Widget appBarButton(String name, VoidCallback onTap, index, {size}){
  return Row(
    children: [
      MouseRegion(
        cursor: SystemMouseCursors.click,
          child: GestureDetector(
          onTap: onTap,
            child: Container(
            decoration: BoxDecoration(
              borderRadius: size==null?BorderRadius.circular(10):null,
            color: curPage == index?Colors.blue:Colors.transparent,
            ),
            height: 40, width: size==null?120:size, 
            child: Align(
              alignment: size ==null?Alignment.center:Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: size==null?0:10),
                child: Text(name, textAlign: size==null?TextAlign.center:TextAlign.left, style: TextStyle(
                  color: curPage == index?Colors.white:Colors.black, 
                ))),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
    ],
  );
}