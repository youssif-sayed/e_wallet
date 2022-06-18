import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserID {
  static var state = true, stateText;
  static User? userID;
  static var db = FirebaseFirestore.instance;

  static Map<String, dynamic> usersIDS = {};

  static Map<String, dynamic> userdata = {
    'name': 'Holder Name',
    'email': '',
    'password': '',
    'id': '${Random().nextInt(100000000).toString()}',
    'balance': 0,
  };

  static Map<String, dynamic> userTransaction = {
    'id': '${Random().nextInt(100000000).toString()}',
    'amount': 0,
    'type': '',
    'date': '',
    'time': '',
    'description': '',
  };

  static void push_user_data() async {
    db
        .collection("userData")
        .doc('${userID?.uid}')
        .set(userdata)
        .onError((e, _) => print("Error writing document: $e"));
    db
        .collection("usersID")
        .doc('IDS')
        .update({'${UserID.userdata['id']}': '${userID?.uid}'}).onError(
            (e, _) => print("Error writing document: $e"));
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

  static Future<void> get_IDS() async {
    final docRef = await db.collection("usersID").doc("IDS");
    docRef.get().then(
      (DocumentSnapshot doc) async {
        final data = await doc.data() as Map<String, dynamic>;
        usersIDS = data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static Future<void> update_balance(var uid, int amount, bool check) async {
    final docRef = await db.collection("userData").doc("${uid}");

    docRef.get().then(
      (DocumentSnapshot doc) async {
        final dataa = await doc.data() as Map<String, dynamic>;

        if (check) {
          var total = dataa['balance'] + amount;
          await db
              .collection("userData")
              .doc('${uid}')
              .update({'balance': total}).onError(
                  (e, _) => print("Error writing document: $e"));
        } else {
          var total = dataa['balance'] - amount;
          final docRef = await db.collection("userData").doc("${uid}");
          docRef.update({
            'balance': total,
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static Future<void> push_bill_data(bill) async {
    await db
        .collection("Bill")
        .doc('${bill['id']}')
        .set(bill)
        .onError((e, _) => print("Error writing document: $e"));

    final docRef =
        await db.collection("userBills").doc("${UserID.userdata['id']}");
    docRef.set({
      '${bill['id']}': false,
    });
  }
}
