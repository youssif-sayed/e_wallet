import 'package:e_wallet/screens/home.dart';

import 'screens/profile.dart';
import 'screens/signin.dart';
import 'screens/signup.dart';
import 'screens/send.dart';
import 'screens/pay.dart';
import 'screens/bill.dart';
import 'package:flutter/material.dart';
import 'screens/intro-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xfff1f1f1),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDBAE72),width: 2.0),
              borderRadius: BorderRadius.circular(30)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDBAE72),width: 2.0),
              borderRadius: BorderRadius.circular(30)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDBAE72),width: 2.0),
              borderRadius: BorderRadius.circular(30)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDBAE72),width: 2.0),
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
      home: introscreen(),
      routes: {
        'Intro':(context) =>introscreen(),
        'SIGNIN': (context) => SIGNIN(),
        'SIGNUP': (context) => SIGNUP(),
        'PROFILE': (context) => Profile(),
        'Send':(context) => Send(),
        'Pay':(context) => Pay(),
        'Bill':(context) => Bill(),
        'Home':(context)=>Home(),
      },
    );
  }
}