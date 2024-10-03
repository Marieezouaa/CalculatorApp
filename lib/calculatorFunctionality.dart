import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatorfunctionality extends StatefulWidget {
  const Calculatorfunctionality({super.key});

  @override
  State<Calculatorfunctionality> createState() {
    return _CalculatorfunctionalityState();
  }
}

class _CalculatorfunctionalityState extends State<Calculatorfunctionality> {
  double buttonSpace = 5.5;
  double rowSpace = 15;

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonFunction(String buttonCharacter) {
    setState(() {
      if (buttonCharacter == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonCharacter == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonCharacter == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '÷');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonCharacter == ".") {
        String lastSegment = equation.split(RegExp(r'[\+\-\*/]')).last;
        if (!lastSegment.contains('.')) {
          equation = equation + buttonCharacter;
        }
      } else {
        if (equation == "0" && buttonCharacter != ".") {
          equation = buttonCharacter;
        } else {
          equation = equation + buttonCharacter;
        }
      }
    });
  }

  Widget calculatorButton(
      String buttonCharacter, void Function()? buttonFunction) {
    return Container(
      width: buttonCharacter == '0' ? 200 : 100,
      height: 55,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            backgroundColor: (buttonCharacter == 'AC' ||
                    buttonCharacter == '+/-' ||
                    buttonCharacter == '%')
                ? const Color.fromARGB(248, 123, 123, 123)
                : (buttonCharacter == '÷' ||
                        buttonCharacter == 'x' ||
                        buttonCharacter == '-' ||
                        buttonCharacter == '+' ||
                        buttonCharacter == '=')
                    ? Colors.orange
                    : const Color.fromARGB(248, 65, 65, 65)),
        child: Text(
          buttonCharacter,
          style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: const Icon(
          Icons.list,
          color: Colors.orange,
          size: 30.5,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(10.0),
                    child: FittedBox(
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        result,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(15.0),
                    child: FittedBox(
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        equation,
                        style: TextStyle(
                          fontSize: 75,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculatorButton("AC", () => buttonFunction("AC")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("+/-", () => buttonFunction("+/-")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("%", () => buttonFunction("%")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("÷", () => buttonFunction("÷")),
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculatorButton("7", () => buttonFunction("7")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("8", () => buttonFunction("8")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("9", () => buttonFunction("9")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("x", () => buttonFunction("*")),
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculatorButton("4", () => buttonFunction("4")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("5", () => buttonFunction("5")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("6", () => buttonFunction("6")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("-", () => buttonFunction("-")),
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculatorButton("1", () => buttonFunction("1")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("2", () => buttonFunction("2")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("3", () => buttonFunction("3")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("+", () => buttonFunction("+")),
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculatorButton("0", () => buttonFunction("0")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton(".", () => buttonFunction(".")),
                SizedBox(
                  width: buttonSpace,
                ),
                calculatorButton("=", () => buttonFunction("=")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
