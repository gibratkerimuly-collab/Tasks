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
        body: Center(
          child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 61, 127, 218),
            border: Border.all(),
          ),
          width: 250,
          height: 150,
          alignment: Alignment.center,
          child: const Text(
          'This is My version ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        ), 
        )
      ),
    );
  }
}
