import 'package:flutter/material.dart';

class Calculator_1_0 extends StatefulWidget {
  const Calculator_1_0({super.key});

  @override
  State<Calculator_1_0> createState() => _Calculator_1_0State();
}

class _Calculator_1_0State extends State<Calculator_1_0> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  double result = 0;

  void add() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = num1 + num2;
    });
  }

  void minus() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = num1 - num2;
    });
  }

  void multi() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = num1 * num2;
    });
  }

  void div() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.exit_to_app)),
          SizedBox(width: 20),
        ],
        backgroundColor: Colors.green,
        title: Text('Calculator 1.0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Enter Number 1', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Enter Number 2', border: OutlineInputBorder()),
              ),
            ),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 40),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 220,
                    height: 60,
                    child: FloatingActionButton.extended(
                      extendedPadding: EdgeInsets.all(50),
                      onPressed: add,
                      tooltip: 'perform addition',
                      label: Text("Addition"),
                      icon: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    height: 60,
                    child: FloatingActionButton.extended(
                      extendedPadding: EdgeInsets.all(50),
                      onPressed: minus,
                      tooltip: 'perform subtraction',
                      label: Text("subtraction"),
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 220,
                    height: 60,
                    child: FloatingActionButton.extended(
                      extendedPadding: EdgeInsets.all(50),
                      onPressed: multi,
                      tooltip: 'Perform Multiplication',
                      label: Text("multiplication"),
                      icon: Icon(Icons.close),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    height: 60,
                    child: FloatingActionButton.extended(
                      extendedPadding: EdgeInsets.all(50),
                      onPressed: div,
                      tooltip: 'Perform Division',
                      label: Text("Division"),
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
