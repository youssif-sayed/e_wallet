import 'package:flutter/material.dart';

class introscreen extends StatelessWidget {
  const introscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  
                  Image(
                      image: AssetImage("images/woman.png"),
                    height: 400,
                  ),
                  SizedBox(height: 20,),
                  Text("Start send, recieve, purchase \n"
                      " your wallet with simple click",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDAA520),
                    ),
                  ),
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: Offset(1, 5),
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)
                          ),
                          color: Color(0xffDAA520),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('SIGNIN');
                          },
                          child:
                          Text('SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 30,
                              offset: Offset(1, 5),
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)
                          ),
                          color: Color(0xfff1f1f1),
                          onPressed: ()
                          {
                            Navigator.of(context).pushReplacementNamed('SIGNUP');
                          },
                          child:
                          Text('SIGN UP',
                            style: TextStyle(
                              color: Color(0xffDAA520),
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
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
