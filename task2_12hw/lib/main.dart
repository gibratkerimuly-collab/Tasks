import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class  CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 50;

  void increase() {
    setState(() {
      count++;
    });
  }

  void decrease() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: Container(
        color: Colors.indigo[200],

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             const  Text(
                'Tap "+" to increment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: decrease,
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  SizedBox(width: 20),

                  Text(
                    "$count",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: increase,
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                'Tap "-" to decrement',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}