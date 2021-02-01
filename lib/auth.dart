import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String email = '';
  String pass = '';
  bool ready = false;
  Timer timer;

  setTimer() {
    if (timer != null) {
      timer.cancel();
    }
    timer = new Timer(Duration(milliseconds: 200), () {
      if (email != '' && pass != '') {
        ready = true;
      } else {
        ready = false;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  auth() {
    showLoading(context);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((err) {
      if (err.toString().split(' ')[0] == '[firebase_auth/user-not-found]') {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass)
            .then((value) {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }).catchError((err) {
          Navigator.of(context).pop();
          showErrDia(context, err);
        });
      } else {
        Navigator.of(context).pop();
        showErrDia(context, err);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              '4Engineer',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            customInput('E-mail', (val) {
              email = val;
              setTimer();
            }, showhint: false, size: 200),
            customInput('Password', (val) {
              pass = val;
              setTimer();
            }, showhint: false, size: 200, obscure: true),
            SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  auth();
                },
                child: Center(
                  child: Opacity(
                    opacity: ready ? 1.0 : 0.3,
                    child: Container(
                      height: 40,
                      width: 300,
                      child: Center(
                        child: Text('Authorize',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customInput(name, valueSetter,
    {TextInputFormatter formatter, showhint, size, obscure}) {
  return Column(
    children: [
      SizedBox(height: 10),
      SizedBox(
        width: size != null ? 300 : (size + 200),
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
              width: size != null ? size : 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: TextField(
                  maxLines: 1,
                  obscureText: obscure != null,
                  decoration: InputDecoration(
                    hintText: showhint == null ? 'Значение' : null,
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    valueSetter(val);
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

showErrDia(context, err) {
  showDialog(
      context: context,
      child: Dialog(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$err'),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text('Ok', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}

showLoading(context) {
  showDialog(
      context: context,
      child: Container(
        color: Colors.black26,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      ));
}
