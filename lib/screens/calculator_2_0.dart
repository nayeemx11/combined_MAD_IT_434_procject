import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '';

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = '';
        _output = '';
      } else if (buttonText == "=") {
        try {
          _output = _evaluate(_input);
        } catch (e) {
          _output = 'Error';
        }
      } else {
        _input += buttonText;
      }
    });
  }

  // String _evaluate(String expression) {
  //   // You can use a library like math_expressions to evaluate the expression.
  //   // For this example, we'll use the eval method for simplicity.
  //   // Make sure to add the 'eval' package to your pubspec.yaml.
  //   // import 'package:eval/eval.dart';

  //   // Parse and evaluate the expression
  //   // final eval = Eval();
  //   // final result = eval.eval(expression);
  //   // return result.toString();

  //   return 'Placeholder'; // Replace with the actual evaluation code.
  // }

  String _evaluate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      // Check if the result is an integer (no decimal part) and return it as an integer.
      if (result % 1 == 0) {
        return result.toInt().toString();
      } else {
        return result.toString();
      }
    } catch (e) {
      return 'Error';
    }
  }

  Widget _buildButton(String buttonText) {
    List<String> stringList = ['+', '-', '/', '*'];

    if (stringList.any((element) => element == buttonText)) {
      return Expanded(
        child: SizedBox(
          height: 133,
          child: MaterialButton(
            elevation: 18.0,
            color: Colors.orange,
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500), // Decreased font size
            ),
            onPressed: () => _onPressed(buttonText),
          ),
        ),
      );
    } else if (buttonText == "=") {
      return Expanded(
        child: SizedBox(
          height: 133,
          child: MaterialButton(
            elevation: 18.0,
            color: Colors.black,
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800), // Decreased font size
            ),
            onPressed: () => _onPressed(buttonText),
          ),
        ),
      );
    } else {
      return Expanded(
        child: SizedBox(
          height: 133,
          child: MaterialButton(
            elevation: 18.0,
            color: Colors.grey,
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300), // Decreased font size
            ),
            onPressed: () => _onPressed(buttonText),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Calculator App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app)),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Input: ",
          //       style: TextStyle(fontSize: 24.0),
          //     ),
          //     Container(
          //       alignment: Alignment.topRight,
          //       padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          //       child: Text(
          //         _input,
          //         style: TextStyle(fontSize: 24.0),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   alignment: Alignment.centerRight,
          //   padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          //   child: Text(
          //     _output,
          //     style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                width: 2,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    Input: ",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
                    child: Text(
                      _input,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                width: 2,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    Result: ",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
                    child: Text(
                      _output,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('C'),
                    _buildButton('('),
                    _buildButton(')'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('%'),
                    _buildButton('='),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
