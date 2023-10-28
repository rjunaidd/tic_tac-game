import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool firstTurn = true;
  List<String> showOnDisplay = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    boxShadow: const [BoxShadow(color: Colors.grey)]),
                child: Center(
                  child: Text(
                    showOnDisplay[index],
                    style: const TextStyle(fontSize: 70, color: Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (firstTurn) {
        showOnDisplay[index] = "o";
      } else {
        showOnDisplay[index] = "x";
      }
      firstTurn = !firstTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (showOnDisplay[0] == showOnDisplay[1] &&
        showOnDisplay[0] == showOnDisplay[2] &&
        showOnDisplay[0] != "") {
      _showWinDialog(showOnDisplay[0]);
    }
    if (showOnDisplay[3] == showOnDisplay[4] &&
        showOnDisplay[3] == showOnDisplay[5] &&
        showOnDisplay[3] != "") {
      _showWinDialog(showOnDisplay[3]);
    }
    if (showOnDisplay[6] == showOnDisplay[7] &&
        showOnDisplay[6] == showOnDisplay[8] &&
        showOnDisplay[6] != "") {
      _showWinDialog(showOnDisplay[6]);
    }
    if (showOnDisplay[0] == showOnDisplay[3] &&
        showOnDisplay[0] == showOnDisplay[6] &&
        showOnDisplay[0] != "") {
      _showWinDialog(showOnDisplay[0]);
    }
    if (showOnDisplay[1] == showOnDisplay[4] &&
        showOnDisplay[1] == showOnDisplay[7] &&
        showOnDisplay[1] != "") {
      _showWinDialog(showOnDisplay[1]);
    }
    if (showOnDisplay[2] == showOnDisplay[5] &&
        showOnDisplay[2] == showOnDisplay[8] &&
        showOnDisplay[2] != "") {
      _showWinDialog(showOnDisplay[2]);
    }
    if (showOnDisplay[6] == showOnDisplay[4] &&
        showOnDisplay[6] == showOnDisplay[2] &&
        showOnDisplay[6] != "") {
      _showWinDialog(showOnDisplay[6]);
    }
    if (showOnDisplay[0] == showOnDisplay[4] &&
        showOnDisplay[0] == showOnDisplay[8] &&
        showOnDisplay[0] != "") {
      _showWinDialog(showOnDisplay[0]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        context:context ,
        builder: (BuildContext){
          return  AlertDialog(
            title: Text("WINNER IS : " + winner),
          );
        });
  }
}
