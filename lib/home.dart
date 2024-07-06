import 'package:calculator_asif/componants/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String username = '';
String result = '';

class _HomeState extends State<Home> {
  void equal() {
    final muser = username.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(muser);
    ContextModel contextModel = ContextModel();
    final equal = expression.evaluate(EvaluationType.REAL, contextModel);
    result = equal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          username,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          result,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          title: 'AC',
                          ontap: () {
                            result = '';
                            username = '';
                            setState(() {});
                          },
                          color: const Color.fromARGB(255, 148, 61, 54),
                        ),
                        Button(
                            title: '+/-',
                            ontap: () {
                              username += '+/-';
                              setState(() {});
                            }),
                        Button(
                            title: '%',
                            ontap: () {
                              if (username.isNotEmpty) username += '%';
                              setState(() {});
                            }),
                        Button(
                          title: '/',
                          ontap: () {
                            if (username.isNotEmpty) username += '/';
                            setState(() {});
                          },
                          // color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            title: '7',
                            ontap: () {
                              username += '7';
                              setState(() {});
                            }),
                        Button(
                            title: '8',
                            ontap: () {
                              username += '8';
                              setState(() {});
                            }),
                        Button(
                            title: '0',
                            ontap: () {
                              username += '0';
                              setState(() {});
                            }),
                        Button(
                          title: 'x',
                          ontap: () {
                            if (username.isNotEmpty) {
                              username += 'x';
                              setState(() {});
                            }
                          },
                          //  color: Colors.black87,
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            title: '4',
                            ontap: () {
                              username += '4';
                              setState(() {});
                            }),
                        Button(
                            title: '5',
                            ontap: () {
                              username += '5';
                              setState(() {});
                            }),
                        Button(
                            title: '6',
                            ontap: () {
                              username += '6';
                              setState(() {});
                            }),
                        Button(
                          title: '-',
                          ontap: () {
                            if (username.isNotEmpty) username += '-';
                            setState(() {});
                          },
                          // color: Color.fromARGB(255, 128, 54, 31),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            title: '1',
                            ontap: () {
                              username += '1';
                              setState(() {});
                            }),
                        Button(
                            title: '2',
                            ontap: () {
                              username += '2';
                              setState(() {});
                            }),
                        Button(
                            title: '3',
                            ontap: () {
                              username += '3';
                              setState(() {});
                            }),
                        Button(
                          title: '+',
                          ontap: () {
                            if (username.isNotEmpty) {
                              username += '+';
                              setState(() {});
                            }
                          },
                          //  color: Color.fromARGB(255, 128, 54, 31),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            title: '9',
                            ontap: () {
                              username += '9';
                              setState(() {});
                            }),
                        Button(
                            title: '.',
                            ontap: () {
                              username += '.';
                              setState(() {});
                            }),
                        Button(
                            title: 'C',
                            ontap: () {
                              if (username.isNotEmpty) {
                                username =
                                    username.substring(0, username.length - 1);
                                setState(() {});
                              } else {
                                username = '0';
                                setState(() {});
                              }
                            },
                            color: Color.fromARGB(255, 103, 54, 51)),
                        Button(
                          title: '=',
                          ontap: () {
                            if (username.isNotEmpty) {
                              equal();
                              setState(() {});
                            } else {}
                          },
                          color: Color.fromARGB(255, 54, 94, 75),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
