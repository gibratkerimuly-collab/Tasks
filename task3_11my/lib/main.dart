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
          title: const Text(
            'Building List View',
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
    return _myListView(context);
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

Widget _myListView(BuildContext context) {
  final List<ListItem> items = List<ListItem>.generate(
    10000,
    (i) => i % 10 == 0
        ? HeadingItem('Heading $i')
        : MessageItem(
            'Sender $i',
            'Message body $i',
          ),
  );

  return ListView.builder(
    padding: const EdgeInsets.all(10),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      
      if (item is HeadingItem) {
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
              item.heading,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
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
      } 

      
      else if (item is MessageItem) {
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
              item.sender,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item.body,
              style: const TextStyle(
                fontSize: 14,
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
      }

      return const SizedBox.shrink();
    },
  );
}