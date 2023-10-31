import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:tic_tac/game_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final myStyle  =const TextStyle(fontSize: 40 , color: Colors.white , fontFamily: "DM Serif Display");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TIC   TAC   TOE" , style:myStyle ),
              SizedBox(
                height: size.height * 0.2,
              ),
             const RippleAnimation(
                child: CircleAvatar(
                  minRadius: 75,
                  maxRadius: 75,
                  backgroundImage: AssetImage("assets/tic.jpg"),
                ),
                color: Colors.white,
                delay:  Duration(milliseconds: 300),
                repeat: true,
                minRadius: 75,
                ripplesCount: 9,
                duration:  Duration(milliseconds: 9 * 300),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>GameScreen()));
               },
               child: Container(
                 height: 65,
                 width: 250,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child:const Center(
                     child: Text("PLAY GAME" , style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold ,fontFamily: "DM Serif Display"),),
                 ),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
