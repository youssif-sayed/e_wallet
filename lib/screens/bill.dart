import 'dart:math';
import 'dart:ui';

import 'package:e_wallet/util/sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  int ProdductsNumbers = 1;
  int num = 1;
  List<String> productsNames = new List.filled(99, '', growable: false);
  List<double> productsPrices = new List.filled(99, 0, growable: false);
  List<int> productsNumbers = new List.filled(99, 1, growable: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ProdductsNumbers,
                      itemBuilder: (BuildContext context, int index) {
                        return Product(index);
                      },
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: Offset(1, 5),
                    )
                  ]),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xfff1f1f1),
                    child: Text(
                      'Add another product +',
                      style: TextStyle(
                        color: Color(0xff7F7FD5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        ProdductsNumbers++;
                      });
                    },
                  ), //adding a product
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xffB8B8E3),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      var names = [];
                      var prices = [];
                      var numbers = [];
                      for (int i = 0; i < ProdductsNumbers; i++) {
                        names.add(productsNames[i]);
                        prices.add(productsPrices[i]);
                        numbers.add(productsNumbers[i]);
                      }
                      Map<String, dynamic> bill = {
                        'names': names,
                        'prices': prices,
                        'numbers': numbers,
                        'sid': UserID.userdata['id'],
                        'id': '${Random().nextInt(100000).toString()}',
                        'status': false,
                      };

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Confirmation',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            content: Text(
                                'Are you sure you want to create this bill?'),
                            actions: [
                              FlatButton(
                                child: Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.green),
                                ),
                                onPressed: () {
                                  UserID.push_bill_data(bill);
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
                                            'your bill has been created\n ID: ${bill['id']}',
                                            style:
                                                TextStyle(color: Colors.green),
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
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Product(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index > 0)
          Divider(
            color: Color(0xff7F7FD5),
          ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffB8B8E3),
              ),
              child: Text(
                'Product ${index + 1}',
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete_rounded,
              ),
              color: Color(0xffFE7D77),
              onPressed: () {
                setState(() {
                  if (ProdductsNumbers > 1) ProdductsNumbers--;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  offset: Offset(1, 5),
                )
              ]),
              child: TextField(
                onChanged: (value) {
                  productsNames[index] = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${productsNumbers[index]}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffB8B8E3),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      productsNumbers[index]++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Color(0xffB8B8E3),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (productsNumbers[index] > 1) productsNumbers[index]--;
                    });
                  },
                  child: Icon(
                    Icons.minimize,
                    color: Color(0xffB8B8E3),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffB8B8E3),
          ),
          child: Text(
            'Price',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: Offset(1, 5),
            )
          ]),
          child: TextField(
            onChanged: (value) {
              productsPrices[index] = double.parse(value);
            },
            keyboardType: TextInputType.number,
            showCursor: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(18)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(18)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(18)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
