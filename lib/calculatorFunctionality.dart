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
  Color topRowColor = const Color.fromARGB(248, 123, 123, 123);
  Color numberColor = const Color.fromARGB(248, 65, 65, 65);
  Color operatorColor = const Color.fromARGB(248, 245, 158, 65);

  Color textColorLight = Colors.white;
  Color textColorDark = Colors.black;

  double buttonSpace = 5;
  double rowSpace = 6;

  double buttonWidth = 100;
  double buttonHeight = 50;

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonFunction(String buttonCharacter) {
    // used to check if the result contains a decimal
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (buttonCharacter == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonCharacter == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonCharacter == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonCharacter == "=") {
        expression = equation;
        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonCharacter;
        } else {
          equation = equation + buttonCharacter;
        }
      }
    });
  }

  Widget calculatorButton(String buttonCharacter, Color backgroundColor,
      Color textColor, void Function()? buttonFunction) {
    return Container(
      width: 75,
      height: buttonCharacter == '=' ? 150 : 70,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: backgroundColor),
        child: Text(
          buttonCharacter,
          style: TextStyle(fontSize: 27, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                        style: const TextStyle(
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
                        style: const TextStyle(
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("AC", topRowColor, textColorLight,
                        () => buttonFunction("AC"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("+/-", topRowColor, textColorLight,
                        () => buttonFunction("+/-"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("%", topRowColor, textColorLight,
                        () => buttonFunction("%"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("/", operatorColor, textColorLight,
                        () => buttonFunction("/")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("7", numberColor, textColorLight,
                        () => buttonFunction("7"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("8", numberColor, textColorLight,
                        () => buttonFunction("8"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("9", numberColor, textColorLight,
                        () => buttonFunction("9"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("X", operatorColor, textColorLight,
                        () => buttonFunction("X")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("4", numberColor, textColorLight,
                        () => buttonFunction("4"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("5", numberColor, textColorLight,
                        () => buttonFunction("5"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("6", numberColor, textColorLight,
                        () => buttonFunction("6"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("-", operatorColor, textColorLight,
                        () => buttonFunction("-")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("1", numberColor, textColorLight,
                        () => buttonFunction("1"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("2", numberColor, textColorLight,
                        () => buttonFunction("2"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("3", numberColor, textColorLight,
                        () => buttonFunction("3"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("+", operatorColor, textColorLight,
                        () => buttonFunction("+")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200,
                    height: buttonHeight,
                    child: calculatorButton("0", numberColor, textColorLight,
                        () => buttonFunction("0"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton(".", numberColor, textColorLight,
                        () => buttonFunction("."))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: calculatorButton("=", operatorColor, textColorLight,
                        () => buttonFunction("=")))
              ],
            )
          ],
        ),
      ),
    );
  }
}
