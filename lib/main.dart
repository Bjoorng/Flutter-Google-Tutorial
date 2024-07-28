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
        routes: {
          '/second': (context) => const SecondPage(
                title: 'To-Do List',
          )
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});
  final String title;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String input = '';
  final List<String> _list = List.empty(growable: true);

  void _addToList() {
    setState(() {
      _list.add(input);
      input = '';
    });
  }

  void _deleteFromList(String input) {
    setState(() {
      _list.removeWhere((element) => element == input);
    });
  }

  void _clearList() {
    setState(() {
      _list.clear();
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
              const Text(
                'Add items to your To-Do List',
              ),
              TextField(
                onChanged: (value) {
                  input = value;
                },
              ),
              ElevatedButton(
                onPressed: _addToList,
                child: const Text('Add'),
              ),
              const Text(
                'Your To-Do List:',
              ),
              Text(_list.toString()),
            ]),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _every10 = 0;
  final List<int> _memory = List.empty(growable: true);

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

  void _emptyList() {
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(Icons.apps_sharp),
          ),
        ],
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
              style: Theme.of(context).textTheme.headlineMedium,
              selectionColor: Colors.blue,
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
