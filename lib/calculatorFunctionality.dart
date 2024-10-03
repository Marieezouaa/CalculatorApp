import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatorfunctionality extends StatefulWidget {
  const Calculatorfunctionality({super.key});

  @override
  State<Calculatorfunctionality> createState() {
    return _CalculatorfunctionalityState();
  }
}

class _CalculatorfunctionalityState extends State<Calculatorfunctionality> {
  Color topRowColor = const Color.fromARGB(249, 194, 194, 194);
  Color numberColor = const Color.fromARGB(248, 65, 65, 65);
  Color operatorColor = const Color.fromARGB(248, 226, 154, 77);

  Color textColorLight = Colors.white;
  Color textColorDark = Colors.black;

  double buttonSpace = 2;
  double rowSpace = 5;

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
            backgroundColor: Colors.black),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: const Icon(Icons.settings, color: Colors.orange),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text('DEG', style: TextStyle(color: Colors.white38)),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(result,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 80))),
                        const Icon(Icons.more_vert,
                            color: Colors.orange, size: 30),
                        const SizedBox(width: 20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(equation,
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white38,
                              )),
                        ),
                        IconButton(
                          icon: const Icon(Icons.backspace_outlined,
                              color: Colors.orange, size: 30),
                          onPressed: () {
                            buttonFunction("⌫");
                          },
                        ),
                        const SizedBox(width: 20),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // TextField(
            //   controller: yourController,
            //   decoration: InputDecoration(
            //     fillColor: const Color.fromARGB(255, 239, 239, 239),
            //     filled: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       // borderSide: BorderSide.none,
            //     ),
            //     hintText: '',
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("AC", topRowColor, textColorDark,
                        buttonFunction("AC"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("+/-", topRowColor, textColorDark,
                        buttonFunction("+/-"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "%", topRowColor, textColorDark, buttonFunction("%"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("/", operatorColor, textColorLight,
                        buttonFunction("/")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "7", numberColor, textColorDark, buttonFunction("7"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "8", numberColor, textColorDark, buttonFunction("8"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "9", numberColor, textColorDark, buttonFunction("9"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("X", operatorColor, textColorLight,
                        buttonFunction("X")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "4", numberColor, textColorDark, buttonFunction("4"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "5", numberColor, textColorDark, buttonFunction("5"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "6", numberColor, textColorDark, buttonFunction("6"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("-", operatorColor, textColorLight,
                        buttonFunction("-")))
              ],
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "1", numberColor, textColorDark, buttonFunction("1"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "2", numberColor, textColorDark, buttonFunction("2"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        "3", numberColor, textColorDark, buttonFunction("3"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("+", operatorColor, textColorLight,
                        buttonFunction("+")))
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
                    height: 50,
                    child: calculatorButton(
                        "0", numberColor, textColorDark, buttonFunction("0"))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton(
                        ".", numberColor, textColorDark, buttonFunction("."))),
                SizedBox(
                  width: buttonSpace,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: calculatorButton("=", operatorColor, textColorLight,
                        buttonFunction("=")))
              ],
            )
          ],
        ),
      ),
    );
  }
}
