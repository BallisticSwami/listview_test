import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

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
    Color addColor;

    List<Color> myColors = [
      Colors.teal,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.pinkAccent
    ];

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
                            print(myColors.length);
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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
                elevation: 5,
                color: myColors[index],
                child: ListTile(
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
                    child: IconButton(
                      color: Colors.black.withOpacity(0.15),
                      icon: Icon(Icons.cancel),
                      iconSize: 50,
                      onPressed: () {
                        myColors.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
