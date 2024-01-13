import 'package:first_session/myButton.dart';
import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
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
    'ANS',
    '=',
  ];

  var input = "";
  var output = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      input,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      output,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 85),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                        onTap: () {
                          setState(() {
                            input = "";
                            output = "0";
                          });
                        },
                        text: buttons[index],
                        color: Colors.green,
                        isOperant: isOperant(buttons[index]));
                  }
                  if (index == 1) {
                    return MyButton(
                        onTap: () {
                          setState(() {
                            input = input.substring(0, input.length - 1);
                          });
                        },
                        text: buttons[index],
                        color: Colors.red,
                        isOperant: isOperant(buttons[index]));
                  }
                  if (!isOperant(buttons[index])) {
                    return MyButton(
                        onTap: () {
                          setState(() {
                            input += buttons[index];
                          });
                        },
                        text: buttons[index],
                        color: const Color.fromARGB(31, 191, 149, 181),
                        isOperant: isOperant(buttons[index]));
                  }
                  return MyButton(
                      onTap: () {
                        if (buttons[index] == "=") {
                          if (input == "") {
                            setState(() {
                              output = "0";
                            });
                          } else {
                            try {
                              if (input.contains("+")) {
                                var numbers = input.split("+");
                                setState(() {
                                  if (numbers[1] == "ANS") {
                                    numbers[1] = output;
                                  }
                                  output = (double.parse(numbers[0]) +
                                          double.parse(numbers[1]))
                                      .toString();
                                  input = output;
                                });
                              } else if (input.contains("-")) {
                                var numbers = input.split("-");
                                if (numbers[1] == "ANS") {
                                  numbers[1] = output;
                                }
                                setState(() {
                                  output = (double.parse(numbers[0]) -
                                          double.parse(numbers[1]))
                                      .toString();
                                  input = output;
                                });
                              } else if (input.contains("x")) {
                                var numbers = input.split("x");
                                if (numbers[1] == "ANS") {
                                  numbers[1] = output;
                                }
                                setState(() {
                                  output = (double.parse(numbers[0]) *
                                          double.parse(numbers[1]))
                                      .toString();
                                  input = output;
                                });
                              } else if (input.contains("/")) {
                                var numbers = input.split("/");
                                if (numbers[1] == "ANS") {
                                  numbers[1] = output;
                                }
                                setState(() {
                                  output = (double.parse(numbers[0]) /
                                          double.parse(numbers[1]))
                                      .toString();
                                  input = output;
                                });
                              } else if (input.contains("%")) {
                                var numbers = input.split("%");
                                if (numbers[1] == "ANS") {
                                  numbers[1] = output;
                                }
                                setState(() {
                                  output = (double.parse(numbers[0]) %
                                          double.parse(numbers[1]))
                                      .toString();
                                  input = output;
                                });
                              }
                            } catch (e) {
                              setState(() {
                                output = "Error";
                              });
                            }
                          }
                        } else {
                          setState(() {
                            if (isOperant(input[input.length - 1])) {
                              input = input.substring(0, input.length - 1);
                              input += buttons[index];
                            } else {
                              input += buttons[index];
                            }
                          });
                        }
                      },
                      text: buttons[index],
                      color: Colors.deepPurple,
                      isOperant: isOperant(buttons[index]));
                },
              )),
        ],
      ),
    );
  }

  bool isOperant(String x) {
    if (x == 'C' ||
        x == 'DEL' ||
        x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
