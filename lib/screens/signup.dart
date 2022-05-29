import 'package:e_wallet/util/sign.dart';
import 'package:flutter/material.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({Key? key}) : super(key: key);

  @override
  _SIGNUPState createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {

  bool _secureText = true;
  String email='',password='',name='';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Color(0xFF6FC3E7),
                  image: DecorationImage(image: AssetImage("images/Signuplogo.png"),),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
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
                        onChanged: (value){
                          name=value;
                        },
                        keyboardType: TextInputType.name,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Please enter a name";
                          }else
                          {
                            return null;
                          }

                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          labelText: 'Name',
                          labelStyle: const TextStyle(
                            color: Color(0xFF6FC3E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        onSaved: (value){
                          email=value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isEmpty || !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value))
                          {
                            return "Please enter a correct account";
                          }else
                          {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          labelText: 'E-mail',
                          labelStyle: const TextStyle(
                            color: Color(0xFF6FC3E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        onSaved: (value){
                          password=value!;
                        },
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Please enter a password";
                          }else if(value.length < 8)
                          {
                            return "Please enter a password more than 8 characters";
                          }else
                          {
                            return !UserSign.state?UserSign.stateText:null;
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6FC3E7),width: 2.0),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF6FC3E7),
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
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: Offset(1, 5),
                                ),
                              ]
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color(0xFF6FC3E7),
                            onPressed: () async{
                              if(_formkey.currentState!.validate())
                              {

                                  print(name);
                                  print(email);
                                  print(password);
                                  UserSign.name=name;
                                  UserSign.emailaddress=email;
                                  UserSign.password;
                                  UserSign.signUp(email,password);
                                  UserSign.state ?Navigator.pushReplacementNamed(context, 'Home'):null;

                              }
                            },
                            child: Text(
                              'SIGN UP',
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
                                  blurRadius: 20,
                                  offset: Offset(1, 5),
                                ),
                              ]
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            color: Color(0xfff1f1f1),
                            onPressed: ()
                            {

                              Navigator.of(context).pushReplacementNamed('SIGNIN');
                            },
                            child: Text(
                              'Have Account',
                              style: TextStyle(
                                color: Color(0xFF6FC3E7),
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
      ),
    );
  }
}
