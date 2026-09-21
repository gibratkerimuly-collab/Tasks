import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Adding Assets'),
          ),
          body: const Center(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/images.jpeg'),
                ),
                Image(image: AssetImage('assets/icon/icon-removebg-preview.png')),
              ],
            ),
          )),
    );
  }
}
