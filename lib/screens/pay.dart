import 'package:e_wallet/util/sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool listState = false;
  var billID = '';
  var names = ['zet', 'sokr', 'shay'];
  var prices = [10.0, 20.0, 50.0];
  var quantaty = [3, 1, 7];
  var productNum = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffF8B8B5),
                      ),
                      child: Text(
                        'Bill ID',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
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
                        onChanged: (value) {
                          billID = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Color(0xffF8B8B5),
                        child: Text(
                          'CHECK',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            UserID.get_bill_data(billID);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserID.billList.isNotEmpty
                              ? Text(
                                  'Bill : ${UserID.billList['id']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: 400,
                            child: UserID.billList.isNotEmpty
                                ? ListView.builder(
                                    itemCount: productNum,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${UserID.billList['names'][index]}',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'x${UserID.billList['numbers'][index]}',
                                                ),
                                                SizedBox(
                                                  width: 200,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${UserID.billList['prices'][index]}',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  UserID.billList.isNotEmpty
                      ? Text(
                          'Total : ${UserID.billList['total']}',
                          style: TextStyle(fontSize: 20),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Color(0xFFFE7D77),
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        if (UserID.billList['total'] >
                            UserID.userdata['balance']) {
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
                                      style:
                                          TextStyle(color: Colors.blueAccent),
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
                                content: Text(
                                    'Are you sure you want to Pay that Bill?'),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onPressed: () {
                                      UserID.update_balance(UserID.userID?.uid,
                                          UserID.billList['total'], false);
                                      UserID.update_balance(
                                          UserID.billList['sid'],
                                          UserID.billList['total'],
                                          true);
                                      UserID.update_bill_status(billID);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Sucsess',
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            ),
                                            content: ListTile(
                                              title: Text(
                                                'Pay completed',
                                                style: TextStyle(
                                                    color: Colors.green),
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
                                                  style: TextStyle(
                                                      color: Colors.blueAccent),
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
}
