import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Moto loves her Little boy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late Future<int> count;
  int _counter = 0;

  // Future<void> getCounterfromSharedPref() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final counterPref = (prefs.getInt('counter') ?? 0) + 1;

  //   setState(() {
  //     count = prefs.setInt('counter', counterPref).then((value) => _counter);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   count = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getInt('counter') ?? 0;
  //   });
  // }

  _incrementCounterOfSP() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int count = (_prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      _counter = count;
    });
    _prefs.setInt('counter', count);
  }

  _getCounterFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? count = prefs.getInt('counter') ?? 0;
    return count;
  }

  _decrementCounterOfSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      _counter = count;
    });
    prefs.setInt('counter', count);
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // [ APPBAR ]
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // [ BODY ]
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'count',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounterOfSP,
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounterOfSP,
                  child: Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),

      // [ Floating Action Button ]
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
