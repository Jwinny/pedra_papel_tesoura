import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        title: 'Pedra/nPapel/nTesoura',
        home: Stack(
          //  alignment: Alignment.center,
          children: [
            Container(
              color: Colors.white,
            ),
            FractionallySizedBox(
              heightFactor: 0.10,
              widthFactor: 1,
              child: Container(
                color: Colors.black,
                child: Text(
                  textAlign: TextAlign.center,
                  "Jokenpo",
                  style: const TextStyle(
                      backgroundColor: Color.fromARGB(0, 255, 255, 0),
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            )
          ],
        ));
  }
}


//Logica de Jogo
      // int count_player = 0;
      // int count_computer = 0;
      // String win = "You win, but i will beat you in the next roll !!! "
      // String draw = "Okay, we draw. Let's try this again "
      // String lose = "You lose, try beat me in your next life, loser !!! "
      // if (userChoice == "rock") {
      //   if (choice == "paper") {  
      //        msg = lose;
      //        count_computer++;
      //    }
      //   else if (choice == "scissor") {
      //        msg = win;
      //        count_player++;
      //    }
      //   else msg = draw;
      // }
      // else if (userChoice == "paper") {
      //   if (choice == "scissor") {
      //        msg = lose;
      //        count_computer++;
      //    }
      //   else if (choice == "rock") {
      //        msg = win;
      //        count_player++;
      //    }
      //   else msg = draw;
      // }
      // else {
      //   if (choice == "rock") {
      //        msg = lose;
      //        count_computer++;
      //    }
      //   else if (choice == "paper") {
      //        msg = win
      //        count_player++;
      // };
      //   else msg = draw;
      // }