import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building layouts'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              Icon(Icons.adjust, size: 55, color: Colors.blue,),
              Icon(Icons.adjust, size: 111, color: Colors.red,),
              Icon(Icons.adjust, size: 55, color: Colors.green,)
            ],
          ) ,
        ),
      ),
    );
  }
}
