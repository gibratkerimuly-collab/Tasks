import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScopedModel Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF333333),
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F7F7),
          foregroundColor: Color(0xFF222222),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const MyHomePage(title: 'Scoped Model'),
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
  final MyModelState _model = MyModelState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: ScopedModel<MyModelState>(
        model: _model,
        child: const _AppRootWidget(),
      ),
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  const _AppRootWidget();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: true,
      builder: (context, child, model) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Current value',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF888888),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${model.counterValue}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 64,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'QUICK CONTROLS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF888888),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Expanded(child: _Counter()),
                  SizedBox(width: 12),
                  Expanded(child: _Counter()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: true,
      builder: (context, child, model) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFEAEAEA),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Child widget',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF888888),
                ),
              ),
              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: Text(
                  '${model.counterValue}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF222222),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _SmallCounterButton(
                      icon: Icons.remove,
                      label: 'Decrease',
                      onPressed: model.decrementCounter,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SmallCounterButton(
                      icon: Icons.add,
                      label: 'Increase',
                      onPressed: model.incrementCounter,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SmallCounterButton extends StatelessWidget {
  const _SmallCounterButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFFF1F1F1),
          foregroundColor: const Color(0xFF333333),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 3),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyModelState extends Model {
  int _counter = 8;

  int get counterValue => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}