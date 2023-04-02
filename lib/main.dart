import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Jokenpo',
      home: MyHomePage(title: 'Jokepo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyGameState();
}

class _MyGameState extends State<MyHomePage> {
  int count_player = 0;
  int count_computer = 0;
  String win = "You win, but i will beat you in the next roll !!! ";
  String draw = "Okay, we draw. Let's try this again ";
  String lose = "You lose, try beat me in your next life, loser !!! ";
  String msg = "Choose an option";

  void selectedOption(String userChoice) {
    List<String> options = ["rock", "paper", "scissor"];
    String computerChoice = options[Random().nextInt(3)];
    setState(() {
      if (userChoice == "rock") {
        if (computerChoice == "paper") {
          msg = lose;
          count_computer++;
        } else if (computerChoice == "scissor") {
          msg = win;
          count_player++;
        } else {
          msg = draw;
        }
      } else if (userChoice == "paper") {
        if (computerChoice == "scissor") {
          msg = lose;
          count_computer++;
        } else if (computerChoice == "rock") {
          msg = win;
          count_player++;
        } else {
          msg = draw;
        }
      } else {
        if (computerChoice == "rock") {
          msg = lose;
          count_computer++;
        } else if (computerChoice == "paper") {
          msg = win;
          count_player++;
        } else {
          msg = draw;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
