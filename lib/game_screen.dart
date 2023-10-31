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
  var playertextstyle = TextStyle(color: Colors.white ,fontSize: 30, fontFamily: "Gloock");
  int firstScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
                child: Container(
                  // color:  Colors.teal.shade800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player  O" ,style: playertextstyle,),
                          Text(firstScore.toString() ,style: playertextstyle,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player  X" , style: playertextstyle,),
                          Text(exScore.toString() , style: playertextstyle,),
                        ],
                      ),
                    ),
                  ],
                ),
                ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
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
            Expanded(
                child: Container(
                  color:  Colors.teal.shade800,
                )
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (firstTurn &&  showOnDisplay[index]  == "") {
        showOnDisplay[index] = "o";
        filledBoxes += 1;
      } else if(!firstTurn &&  showOnDisplay[index]  == ""){
          showOnDisplay[index] = "x";
          filledBoxes += 1;
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
    else if(filledBoxes  == 9){
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
        context:context ,
        builder: ( constBuildContext){
          return  AlertDialog(
            title:const Text("Draw"),

          actions: [
            ElevatedButton(
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child:const Text("Play Again"),
            ),
          ],
          );
        }
        );
  }
  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
        context:context ,
        builder: (BuildContext){
          return  AlertDialog(
            title: Text("WINNER IS : " + winner),

          actions: [
            ElevatedButton(
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child:const Text("Play Again"),
            ),
          ],);
        });
    if(winner == "O"){
      firstScore +=1;
    }else if(winner == "X"){
      exScore += 1;
    }
    _clearBoard();
  }

  void _clearBoard()
  {
  setState(() {
    for(int i=0; i<9; i++){
      showOnDisplay[i] = "";
    } 
  });
  filledBoxes = 0;
  }
}
