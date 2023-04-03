import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

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
  int countPlayer = 0;
  String win = "You win, but i will beat you in the next roll !!! ";
  String draw = "Okay, we draw. Let's try this again ";
  String lose = "You lose, try beat me in your next life, loser !!! ";
  String msg = "Choose an option";

  IconData? get iconComp => null;

  void selectedOption(String userChoice) {
    List<String> options = ["rock", "paper", "scissor"];
    int computerNumber = Random().nextInt(3);
    String computerChoice = options[computerNumber];
    List<IconData> iconOptions = [
      Icons.sports_mma_sharp,
      Icons.back_hand,
      Icons.cut
    ];
    IconData iconComp = iconOptions[computerNumber];
    setState(() {
      if (userChoice == "rock") {
        if (computerChoice == "paper") {
          msg = lose;
          countPlayer--;
        } else if (computerChoice == "scissor") {
          msg = win;
          countPlayer++;
        } else {
          msg = draw;
        }
      } else if (userChoice == "paper") {
        if (computerChoice == "scissor") {
          msg = lose;
          countPlayer--;
        } else if (computerChoice == "rock") {
          msg = win;
          countPlayer++;
        } else {
          msg = draw;
        }
      } else {
        if (computerChoice == "rock") {
          msg = lose;
          countPlayer--;
        } else if (computerChoice == "paper") {
          msg = win;
          countPlayer++;
        } else {
          msg = draw;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rock Paper Scissors"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 184, 131, 194),
          ),
          Center(
            child: Stack(children: [
              Text(
                msg,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(iconComp)
            ]),
          )
        ],
      )),
      floatingActionButton: FractionallySizedBox(
        widthFactor: 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => setState(() {
                selectedOption("paper");
              }),
              tooltip: 'Paper',
              child: const Icon(Icons.back_hand),
            ),
            FloatingActionButton(
              onPressed: () => setState(() {
                selectedOption("rock");
              }),
              tooltip: 'Rock',
              child: const Icon(Icons.sports_mma_sharp),
            ),
            FloatingActionButton(
              onPressed: () => setState(() {
                selectedOption("scissor");
              }),
              tooltip: 'Scissor',
              child: const Icon(Icons.cut),
            )
          ],
        ),
      ),
    );
  }
}
