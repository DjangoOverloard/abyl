import 'package:flutter/material.dart';
import 'auth.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool ready = false;
  bool auth;
  getUser()async{
    // await FirebaseAuth.instance.signOut();
  var firebaseUser = await  FirebaseAuth.instance.authStateChanges().first;
  await Future.delayed(Duration(milliseconds: 400), (){});
  firebaseUser = await  FirebaseAuth.instance.authStateChanges().first;
   auth = firebaseUser!=null?(firebaseUser.email!=null?true:false):false;
   print('authorized: $auth');
    ready = true;
    if(mounted){
    setState((){});
    }
  }
  @override
  void initState() {
   getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abylai Shyngys',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ready
          ? (auth ? HomePage() : AuthPage())
          : Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: Text('4Engineer',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
    );
  }
}
