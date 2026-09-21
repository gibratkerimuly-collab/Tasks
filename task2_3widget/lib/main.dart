import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        "Hello, Flutter",
        style: TextStyle(
          color: Color.fromARGB(255, 1, 48, 70),
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
