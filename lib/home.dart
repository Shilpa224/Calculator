import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 30.0;
  double resultFontSize = 35.0;

  get child => null;
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        double equationFontSize = 30.0;
        double resultFontSize = 35.0;
      } else if (buttonText == "⌫") {
        double equationFontSize = 30.0;
        double resultFontSize = 35.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        double equationFontSize = 30.0;
        double resultFontSize = 35.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        double equationFontSize = 35.0;
        double resultFontSize = 30.0;
        if (equation == "0") {
          equation = buttonText;
        } else
          equation = equation + buttonText;
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
            child: Text(
              equation,
              style: TextStyle(
                  fontSize: equation.length > 18 ? 28 : equationFontSize),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          ExpandedDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("⌫", 1, Colors.blue),
                        buildButton("÷", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.cyan),
                        buildButton("8", 1, Colors.cyan),
                        buildButton("9", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.cyan),
                        buildButton("5", 1, Colors.cyan),
                        buildButton("6", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.cyan),
                        buildButton("2", 1, Colors.cyan),
                        buildButton("3", 1, Colors.cyan),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.pinkAccent),
                        buildButton("0", 1, Colors.pinkAccent),
                        buildButton("00", 1, Colors.pinkAccent),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("×", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
