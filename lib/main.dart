import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Class_2',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Text(
                "1",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
              Text("2",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
              Text("3",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
              Text("4",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
              Text("5",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
              Text("6",
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
