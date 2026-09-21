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
                  image: AssetImage('assets/map/mirage.jpg'),
                ),
                Image(
                    image: AssetImage('assets/person/gamer-removebg-preview.png')),
                Positioned(
                  top: 120,
                  left: 120,
                  child: Text(
                    'My custom font ',
                    style: TextStyle(fontSize: 52, color: Color.fromARGB(255, 255, 254, 254), fontFamily: 'Always in the Star'),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
