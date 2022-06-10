import 'dart:ui';

import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  int ProdductsNumbers = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 80, horizontal: 20
                  ),
                  child: ListView.builder(itemBuilder: Product(),)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.deepPurpleAccent.shade100,
                  child: Text('Recieve',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget Product(){
    int num =1;
    return Column(
      children: [

        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent.shade100,
          ),
          child: Text(
            'Product',
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(5, 10),
                  )
                  ]
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Text(
              '$num',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent.shade100,
              ),
            ),
            SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      num++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent.shade100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (num > 1)
                        num--;
                    });
                  },
                  child: Icon(
                    Icons.minimize,
                    color: Colors.deepPurpleAccent.shade100,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent.shade100,
          ),
          child: Text(
            'Price',
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(5, 10),
              )
              ]
          ),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                  borderRadius: BorderRadius.circular(10)
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                  borderRadius: BorderRadius.circular(10)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ),
        SizedBox(height: 50,),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(5, 10),
                )
                ]
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Colors.white,
              child: Text('Add another product +',
                style: TextStyle(
                  color: Colors.deepPurpleAccent.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ), //adding a product
          ),
        ),

      ],
    );
  }

}





