import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  TextEditingController yourController = TextEditingController();
  String enteredText = "";

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonFunction(String buttonCharacter) {}

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
          style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
    );
  }

  int counter = 1;

  void reset() {
    setState(() {});
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: yourController,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 239, 239, 239),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // borderSide: BorderSide.none,
                ),
                hintText: '',
              ),
            ),
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
