import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building layouts'),
          backgroundColor: const Color.fromARGB(255, 113, 207, 116),
        ),
        
        body: Column(
          children: [

             const SizedBox(height: 20,),

            Container(
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[
                  Icon(
                    Icons.adjust,
                    size: 55,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.adjust,
                    size: 111,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.adjust,
                    size: 55,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Container(
              color: const Color.fromARGB(255, 181, 135, 66),
              width: double.infinity,
              height: 250,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.adjust,
                    size: 55,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.adjust,
                    size: 111,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.adjust,
                    size: 55,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
