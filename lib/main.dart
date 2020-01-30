import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.cyan,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Class_2',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<Color> myColors = [
  Colors.teal,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.pinkAccent
];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color addColor;

    void _showDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Container(
                height: 515,
                child: AlertDialog(
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Submit'),
                        onPressed: () {
                          setState(() {
                            myColors.add(addColor);
                            Navigator.pop(context);
                          });
                        },
                      )
                    ],
                    content: MaterialColorPicker(
                        circleSize: 70,
                        spacing: 15,
                        onColorChange: (Color color) {
                          addColor = color; // Handle color changes
                        },
                        selectedColor: Colors.red)),
              ),
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add a color',
          child: Icon(Icons.add),
          backgroundColor: Colors.cyan,
          elevation: 9,
          onPressed: () {
            setState(() {
              _showDialog();
            });
          },
        ),
        appBar: AppBar(
          title: Text('Hello frens'),
          backgroundColor: Colors.cyan,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
          itemCount: myColors.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                height: size.height * 0.13,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  color: myColors[index],
                  child: Center(
                    child: ListTile(
                      trailing: IconButton(
                        color: Colors.white.withOpacity(0.8),
                        icon: Icon(Icons.close),
                        iconSize: 40,
                        tooltip: 'Remove this color',
                        onPressed: () {
                          setState(() {
                            myColors.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
