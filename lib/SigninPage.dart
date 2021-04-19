import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  //TODO: check authentication
  Future checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/homePage");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  //TODO: signin method
  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final UserCredential authResult =
            await _auth.signInWithEmailAndPassword(
                email: _email.text, password: _password.text);
        final User user = authResult.user;
        print(user.email);
      } catch (e) {
        showErrorMessage(e.message);
        print(e.message);
        print(e);
      }
    }
  }

  //TODO: signup navigation
  navigateToSignUp() {
    Navigator.pushReplacementNamed(context, "/signupPage");
  }

  SignOut() async {
    await _auth.signOut();
  }

  showErrorMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(errorMessage),
            title: Text('Error'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in Page'),
        backgroundColor: Color.fromRGBO(11, 232, 129, 1),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: height,
            width: width,
            color: Color.fromRGBO(72, 84, 96, 1),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: SvgPicture.asset('images/login.svg'),
                  height: height * 0.5,
                  width: width * 0.8,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (input) => _email.text = input,
                    controller: _email,
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Please Enter Email";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 15),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (input) => _password.text = input,
                    controller: _password,
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 6) {
                        return "lenght is too sort";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 15),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20),
                  ),
                  minWidth: width * 0.9,
                  color: Color.fromRGBO(11, 232, 129, 1),
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    navigateToSignUp();
                  },
                  child: Text(
                    "Don't have Account ?",
                    style: TextStyle(
                      color: Colors.white,
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
