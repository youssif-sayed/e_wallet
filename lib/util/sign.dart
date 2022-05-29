import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class UserSign {
  static var name='Holder Name',emailaddress,password,state=true, stateText;
  static signUp(email,password)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state=true;
    } on FirebaseAuthException catch (e) {
      state=false;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        stateText='The account already exists for that email.';
      }
      print('i am in last');
    } catch (e) {
      print(e);
    }
  }

  static signIn(email,password)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      state=true;
    } on FirebaseAuthException catch (e) {
      state=false;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        stateText='No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        stateText='Wrong password provided for that user.';
      }
    }
  }

  static Map<String,dynamic> userdata= {
    'Name':'',
    'email':'',
    'password':'',
    'id':'${Random().nextInt(100000000).toString()}',
    'balance':0,
  };
  static Map<String,dynamic> userTransaction ={

  };

}