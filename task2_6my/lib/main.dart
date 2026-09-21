import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 46, 51, 197),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("My first App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "This is my Homepage",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 150,
                color: const Color.fromARGB(255, 0, 0, 0),
                alignment: Alignment.center,
                child: const Text(
                  "You can do it",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

