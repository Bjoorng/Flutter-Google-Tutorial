import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter app'),
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
  int _every10 = 0;
  List<int> _memory = List.empty(growable: true);

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == _every10 + 10) {
        _every10 = _counter;
        _memory.add(_counter);
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter == _every10 - 10 || _counter == _every10) {
        _every10 = _counter;
        _memory.remove(_counter);
      }
    });
  }

  void _emptyList(){
    setState(() {
      _counter = 0;
      _every10 = 0;
      _memory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_memory',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Update the counter:',
            ),
            const Text('Try as many times as You want:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium, selectionColor: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _emptyList,
            tooltip: 'Clear',
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            child: const Icon(Icons.clear),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
