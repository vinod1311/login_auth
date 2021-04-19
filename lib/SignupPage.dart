import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  navigateToSignin() {
    Navigator.pushReplacementNamed(context, "/signinPage");
  }

  checkAuthatication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/homePage");
      }
    });
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
  void initState() {
    super.initState();
    this.checkAuthatication();
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final UserCredential authResult =
            await _auth.createUserWithEmailAndPassword(
                email: _email.text, password: _password.text);
        final User user = authResult.user;
        if (user != null) {
          user.updateProfile(displayName: '_name');
        }
        print('object');
        print(user.updateProfile(displayName: '_name'));
        print('hiii');
      } catch (e) {
        showErrorMessage(e.message);
        print(e);
      }
    }
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
                  child: SvgPicture.asset('images/signup.svg'),
                  height: height * 0.4,
                  width: width * 0.8,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (input) => _name.text = input,
                    controller: _name,
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Please Enter Name";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 15),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
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
                    signUp();
                  },
                  child: Text(
                    'SIGN UP',
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
                    navigateToSignin();
                  },
                  child: Text(
                    "Already have an account ?",
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
