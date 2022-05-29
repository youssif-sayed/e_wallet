import 'package:flutter/material.dart';

import '../util/sign.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  foregroundImage: AssetImage("images/profile.jpeg"),
                  radius: 75,
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      '${UserSign.name}',
                      style: TextStyle(
                        color: Color(0xffDBAE72),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 75,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xff6FC3E7),
                        size: 25,
                      ),
                      SizedBox(
                        child: FlatButton(
                            onPressed: (){},
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Color(0xff6FC3E7),
                                fontSize: 25,
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffDBAE72),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xff6FC3E7),
                        size: 25,
                      ),
                      SizedBox(
                        child: FlatButton(
                          onPressed: (){},
                          child: Text(
                            'Payment Methods',
                            style: TextStyle(
                              color: Color(0xff6FC3E7),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffDBAE72),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.history,
                        color: Color(0xff6FC3E7),
                        size: 25,
                      ),
                      SizedBox(
                        child: FlatButton(
                          onPressed: (){},
                          child: Text(
                            'History',
                            style: TextStyle(
                              color: Color(0xff6FC3E7),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffDBAE72),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Color(0xff6FC3E7),
                        size: 25,
                      ),
                      SizedBox(
                        child: FlatButton(
                          onPressed: (){},
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              color: Color(0xff6FC3E7),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
