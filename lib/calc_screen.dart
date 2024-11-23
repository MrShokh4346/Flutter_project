import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final TextEditingController _txt = TextEditingController(text: '0');
  String a = '';
  String b = '';
  String oper = '';
  double result = 0;

  void btnPressed(String btnText) {
    if (btnText == 'AC') {
      _txt.text = '0';
      a = '';
      b = '';
      oper = '';
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      oper = btnText;
    } else if (btnText == '=') {
      double x = double.parse(a);
      double y = double.parse(b);
      switch (oper) {
        case '+':
          result = x + y;
          break;
        case '-':
          result = x - y;
          break;
        case 'x':
          result = x * y;
          break;
        case '/':
          result = y == 0 ? 0 : x / y;
          break;
      }

      String z = result
          .toStringAsFixed(10)
          .replaceAll(RegExp(r"0+$"), "")
          .replaceAll(RegExp(r"\.$"), "");
      _txt.text = z;
      a = z;
      b = '';
      oper = '';
    } else if (btnText == '%') {
      if (oper.isEmpty && a.isNotEmpty) {
        a = (double.parse(a) / 100).toString();
        _txt.text = a;
      } else if (b.isNotEmpty) {
        b = (double.parse(b) / 100).toString();
        _txt.text = b;
      }
    } else if (btnText == '±') {
      if (oper.isEmpty && a.isNotEmpty) {
        a = a.startsWith('-') ? a.substring(1) : '-$a';
        _txt.text = a;
      } else if (b.isNotEmpty) {
        b = b.startsWith('-') ? b.substring(1) : '-$b';
        _txt.text = b;
      }
    } else {
      if (oper.isEmpty) {
        a += btnText;
        _txt.text = a;
      } else {
        b += btnText;
        _txt.text = b;
      }
    }
  }

  Widget createButton(String btnText, Color textColor, Color btnColor) {
    return btnText == "0"
        ? InkWell(
      onTap: ()=> btnPressed(btnText),
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: btnColor, borderRadius: BorderRadius.circular(80)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  btnText,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
          )
        : ElevatedButton(
            onPressed: () => btnPressed(btnText),
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: Text(
              btnText,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextField(
                controller: _txt,
                readOnly: true,
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.end,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  createButton('AC', Colors.black, Colors.grey),
                  createButton('±', Colors.black, Colors.grey),
                  createButton('%', Colors.black, Colors.grey),
                  createButton('÷', Colors.white, Colors.orange),
                  createButton('7', Colors.white, Colors.grey.shade800),
                  createButton('8', Colors.white, Colors.grey.shade800),
                  createButton('9', Colors.white, Colors.grey.shade800),
                  createButton('x', Colors.white, Colors.orange),
                  createButton('4', Colors.white, Colors.grey.shade800),
                  createButton('5', Colors.white, Colors.grey.shade800),
                  createButton('6', Colors.white, Colors.grey.shade800),
                  createButton('-', Colors.white, Colors.orange),
                  createButton('1', Colors.white, Colors.grey.shade800),
                  createButton('2', Colors.white, Colors.grey.shade800),
                  createButton('3', Colors.white, Colors.grey.shade800),
                  createButton('+', Colors.white, Colors.orange),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                    height: (MediaQuery.of(context).size.width-70)/4,
                    width: (MediaQuery.of(context).size.width-70)/2+10,
                    child: createButton('0', Colors.white, Colors.grey.shade800)),
                SizedBox(width: 10,),
                SizedBox(
                    height: (MediaQuery.of(context).size.width-70)/4,
                    width: (MediaQuery.of(context).size.width-70)/4,
                    child: createButton('.', Colors.white, Colors.grey.shade800)),
                SizedBox(width: 10,),
                SizedBox(
                    height: (MediaQuery.of(context).size.width-70)/4,
                    width: (MediaQuery.of(context).size.width-70)/4,
                    child: createButton('=', Colors.white, Colors.orange)),
              ],
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: const CalculatorApp(),
  ));
}
