import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class UserID {


  static var state=true, stateText;
  static User? userID;
  static var db = FirebaseFirestore.instance;





  static Map<String,dynamic> userdata= {
    'name':'Holder Name',
    'email':'',
    'password':'',
    'id':'${Random().nextInt(100000000).toString()}',
    'balance':0,
  };

  static Map<String,dynamic> userTransaction ={

  };

  static void push_user_data() async {
    db.collection("userData").doc('${userID?.uid}').set(userdata).onError((e, _) => print("Error writing document: $e"));
  }

  static Future<void> get_user_data() async {
    final docRef = await db.collection("userData").doc("${userID?.uid}");
    docRef.get().then(
          (DocumentSnapshot doc) async {
        final data = await doc.data() as Map<String, dynamic>;
        userdata = data;

      },
      onError: (e) => print("Error getting document: $e"),
    );
  }



}