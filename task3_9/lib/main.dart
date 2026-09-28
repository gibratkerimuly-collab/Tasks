import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building List View'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  const BodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: const EdgeInsets.all(8.0),
    reverse: true,
    children: const <Widget>[
      Card(
        color: Colors.blue,
        child: ListTile(
          title: Text(
            'Sun',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Today Clear',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Icon(
            Icons.wb_sunny,
            color: Colors.white,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ),
      ),

      Card(
        color: Colors.grey,
        child: ListTile(
          title: Text(
            'Cloudy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Today Cloudy',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Icon(
            Icons.wb_cloudy,
            color: Colors.white,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ),
      ),

      Card(
        color: Colors.indigo,
        child: ListTile(
          title: Text(
            'Snow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Today Snow',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Icon(
            Icons.ac_unit,
            color: Colors.white,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}