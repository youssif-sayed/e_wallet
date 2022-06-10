import 'package:e_wallet/util/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SIGNIN extends StatefulWidget {
  const SIGNIN({Key? key}) : super(key: key);

  @override
  _SIGNINState createState() => _SIGNINState();
}

class _SIGNINState extends State<SIGNIN> {
  var email, password;
  bool _secureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String? _errorText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFDBAE72),
                image: DecorationImage(
                  image: AssetImage("images/Signinlogo.png",),),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: Padding(padding: const EdgeInsets.symmetric(
                  horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    TextFormField(
                      onSaved: (String? email) {
                        _email = email!.trim();
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(email)) {
                          return 'Email is invalid';
                        }
                        return null;
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

                      validator: (String? password) {
                        if (password == null || password.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      onSaved: (String? password) {
                        _password = password!.trim();
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
                              _secureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility),
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
                          onPressed: () {

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
                          onPressed: () {
                            _login(context);},
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
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                                'SIGNUP');
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


  void _login(BuildContext context) async {
    final formState = _formKey.currentState;
    setState(() => _errorText = null);

    if (formState != null) {
      if (formState.validate()) {
        formState.save();

        User? user = await signInUsingEmailPassword(
          email: _email,
          password: _password,
          context: context,
        );

        if (user?.uid != null) {
          UserID.userID = user;
          UserID.get_user_data();


          await Navigator.of(context).pushReplacementNamed('Loading');
        } else {
          print('not erorr');
          setState(() => _errorText = 'Email or Password is incorrect');
        }

      }
    }
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

    }
    return user;
  }
}
