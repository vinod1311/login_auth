import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isSignedIn = false;

  checkAuthantication() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/signinPage');
      }
    });
  }

  getUser() async {
    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
      });
    }
    print(this.user);
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuthantication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 84, 96, 1),
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(color: Color.fromRGBO(44, 58, 71, 1)),
        ),
        backgroundColor: Color.fromRGBO(11, 232, 129, 1),
        brightness: Brightness.light,
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(11, 232, 129, 1)),
              accountName: Text(
                'ROhdx',
                style: TextStyle(
                  color: Color.fromRGBO(44, 58, 71, 1),
                  fontSize: 15,
                ),
              ),
              accountEmail: Text(
                'Rodx@test.com',
                style: TextStyle(
                  color: Color.fromRGBO(44, 58, 71, 1),
                  fontSize: 17,
                ),
              ),
              arrowColor: Color.fromRGBO(11, 232, 129, 1),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromRGBO(72, 84, 96, 1),
                child: Text('RP'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color.fromRGBO(72, 84, 96, 1),
                size: 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Color.fromRGBO(44, 58, 71, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            Divider(
              color: Color.fromRGBO(72, 84, 96, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Color.fromRGBO(72, 84, 96, 1),
                size: 35,
              ),
              title: Text(
                'Map',
                style: TextStyle(
                    color: Color.fromRGBO(44, 58, 71, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/map");
              },
            ),
            Divider(
              color: Color.fromRGBO(72, 84, 96, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.person_add,
                color: Color.fromRGBO(72, 84, 96, 1),
                size: 35,
              ),
              title: Text(
                'Participants',
                style: TextStyle(
                    color: Color.fromRGBO(44, 58, 71, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/participants");
              },
            ),
            Divider(
              color: Color.fromRGBO(72, 84, 96, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Color.fromRGBO(72, 84, 96, 1),
                size: 35,
              ),
              title: Text(
                'Message',
                style: TextStyle(
                    color: Color.fromRGBO(44, 58, 71, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/message");
              },
            ),
            Divider(
              color: Color.fromRGBO(72, 84, 96, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.assignment_turned_in,
                color: Color.fromRGBO(72, 84, 96, 1),
                size: 35,
              ),
              title: Text(
                'Attendance',
                style: TextStyle(
                    color: Color.fromRGBO(44, 58, 71, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/attendance");
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
