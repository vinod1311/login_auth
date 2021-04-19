import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 84, 96, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 232, 129, 1),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          'Messages',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(44, 58, 71, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Text(
            'Edit',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(44, 58, 71, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.edit,
              color: Color.fromRGBO(44, 58, 71, 1),
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                  hintText: 'Search Settings',
                  hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: InputBorder.none),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 60,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Driver',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Give reply to given message as soon as possible.',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
