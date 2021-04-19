import 'package:flutter/material.dart';
import 'package:login_auth/SigninPage.dart';
import 'HomePage.dart';
import 'SigninPage.dart';
import 'SignupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Map.dart';
import 'Message.dart';
import 'Attendance.dart';
import 'Participant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login_Auth',
      home: SigninPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/signinPage": (BuildContext context) => SigninPage(),
        "/signupPage": (BuildContext context) => SignupPage(),
        "/homePage": (BuildContext context) => HomePage(),
        "/map": (BuildContext context) => Map(),
        "/message": (BuildContext context) => Message(),
        "/attendance": (BuildContext context) => Attendance(),
        "/participant": (BuildContext context) => Participant(),
      },
    );
  }
}
