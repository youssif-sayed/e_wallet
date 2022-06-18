import 'package:e_wallet/util/sign.dart';
import 'package:flutter/material.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  String erorrText = '';
  var snedID;
  var amount;
  var payLists = [
    'BALANCE\n${UserID.userdata['balance']}',
    'MY CARD',
    'ADD\n+'
  ];
  late SliverGridDelegate gridDelegate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF3B2D9),
                    ),
                    child: Text(
                      'User ID',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        snedID = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF3B2D9),
                    ),
                    child: Text(
                      'Amount',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        amount = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF3B2D9),
                    ),
                    child: Text(
                      'Payment Method',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      PayOption(0),
                      PayOption(1),
                      PayOption(2),
                    ],
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    erorrText,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Color(0xffF3B2D9),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: Color(0xfff1f1f1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Submit();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget PayOption(int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 100,
          height: 100,
          child: Center(
            child: Text(
              payLists[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff787878),
              ),
            ),
          ),
        ),
        index != 0
            ? Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0x80787878),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
            : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0x50F3B2D9),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
      ],
    );
  }

  void Submit() async {
    await UserID.get_IDS();
    await Future.delayed(const Duration(seconds: 1), () {});
    var searchedID = UserID.usersIDS['$snedID'];
    var amount = int.parse(this.amount);
    if (snedID == null || amount == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(color: Colors.blueAccent),
            ),
            content: Text(
              'Please fill all the fields',
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else if (searchedID == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(color: Colors.blueAccent),
            ),
            content: Text(
              'Can\'t find the user',
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else if (amount > UserID.userdata['balance']) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(color: Colors.blueAccent),
            ),
            content: Text(
              'You don\'t have enough balance',
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else if (amount < 1) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(color: Colors.blueAccent),
            ),
            content: Text(
              'Please enter a valid amount',
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Confirmation',
              style: TextStyle(color: Colors.blueAccent),
            ),
            content: Text('Are you sure you want to send $amount to $snedID?'),
            actions: [
              FlatButton(
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  UserID.update_balance(UserID.userID?.uid, amount, false);
                  UserID.update_balance(searchedID, amount, true);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Sucsess',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        content: ListTile(
                          title: Text(
                            'Transaction completed',
                            style: TextStyle(color: Colors.green),
                          ),
                          leading: Icon(
                            Icons.done_rounded,
                            color: Colors.green,
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              FlatButton(
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }
}
