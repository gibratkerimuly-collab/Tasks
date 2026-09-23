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
        body: const Center (
          child: Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        ) 
      ),
    );
  }
}
