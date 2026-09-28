import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building layouts'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 67, 111, 199),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                    'assets/images/assets/images/Screenshot 2026-09-25 at 09.50.43.png',
                  ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.red,
                child: const Text('1'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.green,
                child: const Text('2'),
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.blue,
              child: const Text('3'),
            )),
          ],
        ),
      ),
    );
  }
}
