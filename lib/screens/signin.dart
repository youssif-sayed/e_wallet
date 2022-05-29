import 'package:e_wallet/util/sign.dart';
import 'package:flutter/material.dart';

class SIGNIN extends StatefulWidget {
  const SIGNIN({Key? key}) : super(key: key);

  @override
  _SIGNINState createState() => _SIGNINState();
}

class _SIGNINState extends State<SIGNIN> {
  var email,password;
  bool _secureText = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFDBAE72),
                image: DecorationImage(image: AssetImage("images/Signinlogo.png",),),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Form(
              key: _formkey,
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){email=value;},
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "Please enter a correct account";
                        }else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(
                          color: Color(0xFFc3823f),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      onChanged: (value){password=value;},
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "Enter your password, please";
                        }else
                        {
                          return !UserSign.state?UserSign.stateText:null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color(0xFFc3823f),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _secureText ? Icons.visibility_off_outlined : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _secureText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          onPressed: ()
                          {

                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 30,
                              offset: Offset(1, 5),
                            ),
                          ]
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          color: Color(0xFFDBAE72),
                          onPressed: () async{
                            if(_formkey.currentState!.validate())
                            {
                              UserSign.emailaddress=email;
                              UserSign.password=password;
                              UserSign.signIn(email, password);
                              UserSign.state ?Navigator.pushReplacementNamed(context, 'Home'):null;
                            }
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Color(0xfff1f1f1),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 30,
                              offset: Offset(1, 5),
                            ),
                          ]
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)),
                          color: Color(0xfff1f1f1),
                          onPressed: ()
                          {
                            Navigator.of(context).pushReplacementNamed('SIGNUP');
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFFDBAE72),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
