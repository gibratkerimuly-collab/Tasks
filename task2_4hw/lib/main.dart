import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        "Hello, Flutter",
        style: TextStyle(
          color: Color.fromARGB(255, 184, 38, 9),
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
