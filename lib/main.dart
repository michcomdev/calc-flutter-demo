import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List numbers = [];
  String actualNumber = "0";
  String operation = "";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: width * 0.9,
                height: height * 0.1,
                child: Center(
                  child: Text(
                    actualNumber,
                    style: TextStyle(fontSize: 40, color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                )),
            SizedBox(
              height: height * 0.02,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton("1", "1", Colors.grey),
                myButton("2", "2", Colors.grey),
                myButton("3", "3", Colors.grey),
                myButton("+", "+", Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton("4", "4", Colors.grey),
                myButton("5", "5", Colors.grey),
                myButton("6", "6", Colors.grey),
                myButton("-", "-", Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton("7", "7", Colors.grey),
                myButton("8", "8", Colors.grey),
                myButton("9", "9", Colors.grey),
                myButton("*", "*", Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton(".", ".", Colors.grey),
                myButton("0", "0", Colors.grey),
                myButton(",", ",", Colors.grey),
                myButton("/", "/", Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton("=", "=", Colors.orange),
                myButton("clr", "clr", Colors.red)
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget myButton(String text, String value, Color color) {
    return InkWell(
      onTap: () {
        if (value == "clr") {
          setState(() {
            actualNumber = "0";
          });
        } else if (value == "+") {
          setState(() {
            numbers.add(actualNumber);
            actualNumber = "0";
            operation = "+";
          });
        } else if (value == "-") {
          setState(() {
            numbers.add(actualNumber);
            actualNumber = "0";
            operation = "-";
          });
        } else if (value == "*") {
          setState(() {
            numbers.add(actualNumber);
            actualNumber = "0";
            operation = "*";
          });
        } else if (value == "/") {
          setState(() {
            numbers.add(actualNumber);
            actualNumber = "0";
            operation = "/";
          });
        } else if (value == "=") {
          log(numbers.toString());
          log(operation);
          setState(() {
            numbers.add(actualNumber);
          });
          actualNumber = "0";
          if (operation == "+") {
            numbers.forEach((number) {
              setState(() {
                actualNumber =
                    (double.parse(actualNumber) + double.parse(number))
                        .toString();
              });
            });
          }
        } else {
          setState(() {
            actualNumber = actualNumber + value;
          });
        }
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 40,
        child: Center(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }
}
