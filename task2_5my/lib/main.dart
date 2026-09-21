

import 'package:flutter/material.dart';

void main () {
  runApp(
    const MaterialApp(
      home: Center(
        child: Text(
          "Hello, Flutter!",
          style: TextStyle(fontSize: 36,
          color: Color.fromARGB(255, 14, 24, 162)),
          textDirection: TextDirection.ltr,
          
        ),
      ),
    ),
  );
}