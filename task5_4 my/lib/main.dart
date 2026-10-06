import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstHome(),
      routes: {
        '/first': (context) => const FirstHome(),
        '/second': (context) => const SecondHome(),
      },
    ),
  );
}

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 130, 59),
      appBar: AppBar(
        title: const Text('First Home'),
        backgroundColor: Color.fromARGB(255, 236, 100, 41),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: 'Konstantin', age: 36);

            Navigator.pushNamed(
              context,
              '/second',
              arguments: user,
            );
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  const SecondHome({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;

    final user = settings.arguments as User;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 130, 59),
      appBar: AppBar(
        title: Text('${user.name} - ${user.age}'),
        backgroundColor: Color.fromARGB(255, 236, 100, 41),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });
}