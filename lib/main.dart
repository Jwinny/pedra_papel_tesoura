import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpo',
      home: MyHomePage(title: 'Jokenpo'),
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
  String win = "You win, but I will beat you in the next roll!";
  String draw = "Okay, we draw. Let's try this again.";
  String lose = "You lose, try to beat me in your next life, loser!";
  String msg = "Choose an option";
  IconData? iconComp;

  void selectedOption(String userChoice) {
    List<String> options = ["rock", "paper", "scissor"];
    int computerNumber = Random().nextInt(3);
    String computerChoice = options[computerNumber];
    List<IconData> iconOptions = [
      Icons.sports_mma_sharp,
      Icons.back_hand,
      Icons.cut
    ];
    iconComp = iconOptions[computerNumber];

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
        title: const Text("Rock Paper Scissors"),
        backgroundColor: Colors.lightBlue[500],
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              color:Colors.lightBlue[100],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (iconComp != null) Icon(iconComp),
                ],
              ),
            ),
          ],
        ),
      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
