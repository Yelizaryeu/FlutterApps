import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tap \"-\" to decrement",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Container(
            decoration: ShapeDecoration(
                color: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0))),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _decrementCounter,
                      icon: Icon(Icons.remove, color: Colors.redAccent)),
                  Text(
                    "$_counter",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  IconButton(
                      onPressed: _incrementCounter,
                      icon: Icon(Icons.add, color: Colors.greenAccent)),
                ],
              ),
            ),
          ),
          Text(
            "Tap \"+\" to increment",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          )
        ],
      )),
    );
  }
}
