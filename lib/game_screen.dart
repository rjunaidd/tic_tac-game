import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {


    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: GridView.builder(
          itemCount: 9,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3
          ) ,
          itemBuilder:(BuildContext context , int index){
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey)
                ]
              ),
              child: Center(
                child: Text("" , style: TextStyle(
                  fontSize: 70 ,
                  color: Colors.black
                ),),
              ),
            );
          },


        ),
      ),
    );
  }
}
