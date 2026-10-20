
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Inherited Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: MyInheritedWidget(
        counter: _counter,
        increment: _incrementCounter,
        decrement: _decrementCounter,
        child: const AppRootWidget(),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const MyInheritedWidget({
    super.key,
    required this.counter,
    required this.increment,
    required this.decrement,
    required super.child,
  });

  static MyInheritedWidget of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();

    assert(result != null, 'MyInheritedWidget not found');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MyInheritedWidget.of(context);

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(
            '(Root Widget)',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${data.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(child: Counter()),
              Expanded(child: Counter()),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MyInheritedWidget.of(context);

    return Card(
      margin: const EdgeInsets.all(6).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('(Child Widget)'),
          Text(
            '${data.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.red),
                onPressed: data.decrement,
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.green),
                onPressed: data.increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}