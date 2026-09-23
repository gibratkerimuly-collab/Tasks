import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Building Layouts"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(),
          ),
          width: 250,
          height: 150,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: const Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        ), 
      ),
    );
  }
}
