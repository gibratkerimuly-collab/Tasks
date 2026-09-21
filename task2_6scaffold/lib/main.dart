import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 46, 51, 197),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("My first App"),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              " This is my Homepage",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    ),
  );
}
