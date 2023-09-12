import 'package:flutter/material.dart';
import 'package:practice/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
class myHomepage extends StatefulWidget {
  const myHomepage({super.key});

  @override
  State<myHomepage> createState() => _myHomepageState();
}

class _myHomepageState extends State<myHomepage> {
  var userQuestion = "";
  var userAnswer = "";

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: (Colors.purple[100]),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.purple[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return myButton(
                            buttonTaaped: () {
                              setState(() {
                                userQuestion = "";
                              });
                            },
                            color: Colors.green,
                            buttonText: buttons[index],
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return myButton(
                              buttonTaaped: () {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                });
                              },
                              color: Colors.orange,
                              buttonText: buttons[index],
                              textColor: Colors.white);
                        }else if (index == buttons.length-1) {
                          return myButton(
                              buttonTaaped: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              color: Colors.lightGreenAccent,
                              buttonText: buttons[index],
                              textColor: Colors.black);
                        } else {
                          return myButton(
                            buttonTaaped: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            buttonText: buttons[index],
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      }),
                ))
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void equalPressed(){
    String finalQuestion=userQuestion;
    finalQuestion=finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer=eval.toString();



  }
}
