
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanilla Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double size = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return IconButton(
              iconSize: size,
              onPressed: () {
                setState(() {
                  _rating = index + 1;
                });
              },
              icon: Icon(
                index < _rating
                    ? Icons.star
                    : Icons.star_border,
                color: Colors.indigo,
              ),
            );
          }),
        ),
      ),
    );
  }
}
