import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Building layouts"),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 50, top: 60),
          child: Text(
            'Hello flutter!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
