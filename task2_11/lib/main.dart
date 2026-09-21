import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Always in the Star'),
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
                Image(
                    image: AssetImage('assets/icon/icon-removebg-preview.png')),
                Positioned(
                  top: 410,
                  left: 150,
                  child: Text(
                    'My custom font ',
                    style: TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Always in the Star'),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
