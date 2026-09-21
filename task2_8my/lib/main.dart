

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 67, 58, 139),
        appBar: AppBar(
          title: const Text("My First App"),
          centerTitle: true,
        ), 
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.videogame_asset,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.23,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                    minHeight: 3,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "23 %",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Press Button  to Download ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ) 
              ],
            ),
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.download_for_offline),
        ),
      ),
    );
  }
}
