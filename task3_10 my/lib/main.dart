import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tasks',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
  final List<String> items =
      List<String>.generate(16, (i) => 'Task ${i + 1}');

  return ListView.builder(
    padding: const EdgeInsets.all(10),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.blue.shade50,
        elevation: 3,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),

          title: Text(
            items[index],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          leading: const Icon(
            Icons.task_alt,
            color: Color.fromARGB(255, 41, 177, 43),
            size: 28,
          ),

          trailing: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      );
    },
  );
}