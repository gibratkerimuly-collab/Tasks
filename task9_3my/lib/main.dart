
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
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F8FA),
          foregroundColor: Color(0xFF202124),
          elevation: 0,
        ),
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
        title: const Text(
          'Inherited Widget',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
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

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            'SHARED COUNTER',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              color: Color(0xFF777F8C),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: Color(0xFFE8EBF0)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    const Text(
                      'Root Widget',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF777F8C),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '${data.counter}',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF202124),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Current value',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF9AA1AC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Child Widgets',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF202124),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Row(
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
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE8EBF0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'COUNTER',
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 1.2,
                color: Color(0xFF777F8C),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '${data.counter}',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Color(0xFF202124),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: data.decrement,
                  icon: const Icon(Icons.remove),
                  color: const Color(0xFF555F70),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF0F2F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(width: 6),

                IconButton(
                  onPressed: data.increment,
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF356AE6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
