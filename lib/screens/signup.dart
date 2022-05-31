import 'package:e_wallet/util/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({Key? key}) : super(key: key);

  @override
  _SIGNUPState createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {

  bool _secureText = true;
  final _formkey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name= '';
  String? _errorText;


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
                        onSaved: (String? value){
                          _name=value!.trim();
                          UserID.userdata ['name'] = _name;
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
                        onSaved: (String? email) {
                          _email = email!.trim();
                          UserID.userdata ['email'] = _email;
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
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        onSaved: (String? password) {
                          _password = password!.trim();
                          UserID.userdata ['password'] = _password;
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
                            onPressed: () => _signup(context),
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




  void _signup(BuildContext context) async {
    final formState = _formKey.currentState;
    setState(() => _errorText = null);

    if (formState != null) {
      if (formState.validate()) {
        formState.save();
         print('i amm calling signup function');
        User? user = await signUpUsingEmailPassword(
          email: _email,
          password: _password,
          context: context,
        );
         print('signup done');
        if (user?.uid != null) {
          UserID.userID = user;
          UserID.push_user_data();


          Navigator.of(context).pushReplacementNamed('Home');
        } else {
          setState(() => _errorText = 'Email or Password is incorrect');
        }

      }
    }
  }

  static Future<User?> signUpUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;


      try {
        print('i am inside try');
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:email,
          password: password,
        );
        user = credential.user;
      } on FirebaseAuthException catch (e) {

        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');

        }
        print('i am in last');
      } catch (e) {
        print(e);
      }

      return user;
    }
  }

