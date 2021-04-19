import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 84, 96, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 232, 129, 1),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          'Map',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(44, 58, 71, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
