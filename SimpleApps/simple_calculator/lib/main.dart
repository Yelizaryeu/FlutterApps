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
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyCalculator(title: 'Simple Calculator'),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key, required this.title});

  final String title;

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _firstElement = "";
  String _secondElement = "";
  String _opetator = "";
  String _answer = "";

  void _addOne() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "1";
      } else {
        _secondElement += "1";
      }
    });
  }

  void _addTwo() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "2";
      } else {
        _secondElement += "2";
      }
    });
  }

  void _addThree() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "3";
      } else {
        _secondElement += "3";
      }
    });
  }

  void _addFour() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "4";
      } else {
        _secondElement += "4";
      }
    });
  }

  void _addFive() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "5";
      } else {
        _secondElement += "5";
      }
    });
  }

  void _addSix() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "6";
      } else {
        _secondElement += "6";
      }
    });
  }

  void _addSeven() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "7";
      } else {
        _secondElement += "7";
      }
    });
  }

  void _addEight() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "8";
      } else {
        _secondElement += "8";
      }
    });
  }

  void _addNine() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "9";
      } else {
        _secondElement += "9";
      }
    });
  }

  void _addZero() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "0";
      } else {
        _secondElement += "0";
      }
    });
  }

  void _plus() {
    setState(() {
      _opetator = "+";
    });
  }

  void _minus() {
    setState(() {
      _opetator = "-";
    });
  }

  void _multiply() {
    setState(() {
      _opetator = "*";
    });
  }

  void _divide() {
    setState(() {
      _opetator = "/";
    });
  }

  void _precentage() {
    setState(() {
      if (_opetator == "") {
        _firstElement += "0";
      } else {
        _secondElement += "0";
      }
    });
  }

  void _clearAnswer() {
    setState(() {
      _firstElement = "";
      _opetator = "";
      _secondElement = "";
    });
  }

  void _calculate() {
    setState(() {
      switch (_opetator) {
        case "+":
          _firstElement =
              (double.parse(_firstElement) + double.parse(_secondElement))
                  .toString();
          _opetator = "";
          _secondElement = "";
          break;
        case "-":
          _firstElement =
              (double.parse(_firstElement) - double.parse(_secondElement))
                  .toString();
          _opetator = "";
          _secondElement = "";
          break;
        case "*":
          _firstElement =
              (double.parse(_firstElement) * double.parse(_secondElement))
                  .toString();
          _opetator = "";
          _secondElement = "";
          break;
        case "/":
          _firstElement =
              (double.parse(_firstElement) / double.parse(_secondElement))
                  .toString();
          _opetator = "";
          _secondElement = "";
          break;
        case "%":
          _firstElement =
              (double.parse(_firstElement) % double.parse(_secondElement))
                  .toString();
          _opetator = "";
          _secondElement = "";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200.0,
              child: Text(
                "$_firstElement" + "$_opetator" + "$_secondElement",
                style: TextStyle(fontSize: 100.0),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _clearAnswer,
                                child: Text(
                                  "C",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addSeven,
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addFour,
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addOne,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _precentage,
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _divide,
                                child: Text(
                                  "/",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addEight,
                                child: Text(
                                  "8",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addFive,
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addTwo,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addZero,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _multiply,
                                child: Text(
                                  "X",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addNine,
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addSix,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addThree,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: OutlinedButton(
                                onPressed: _addOne,
                                child: Text(
                                  ",",
                                  style: TextStyle(
                                      fontSize: 50.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _addOne,
                                child: Icon(
                                  Icons.backspace,
                                  size: 50,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _addOne,
                                child: Text(
                                  "+/-",
                                  style: TextStyle(
                                      fontSize: 40.0, color: Colors.cyan),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _minus,
                                child: Icon(
                                  Icons.remove,
                                  size: 50,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: OutlinedButton(
                                onPressed: _plus,
                                child: Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.cyan,
                              child: OutlinedButton(
                                onPressed: _calculate,
                                child: Text(
                                  "=",
                                  style: TextStyle(
                                      fontSize: 70.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
