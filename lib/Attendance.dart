import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  Attendance({Key key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 84, 96, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 232, 129, 1),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          'Attedance',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(44, 58, 71, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Who is Coming tomorrow ?',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Coming',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: Colors.red,
                                value: this.valuefirst,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuefirst = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Not Coming',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: Colors.red,
                                value: this.valuefirst,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuefirst = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
