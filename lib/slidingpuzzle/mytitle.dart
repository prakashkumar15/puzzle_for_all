import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {


  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(16.0),

      child: Column(
        children: [
          Center(

            child: Text(

              "Sliding Puzzle:",

              style:TextStyle(

letterSpacing: 1,
    fontSize: 20,
    foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = Colors.black,


    ),
            ),

          ),
          Center(
            child: Text(
              "Arrange from 1 to 15 ,To win ",
              style: TextStyle(
fontSize: 20,
              ),

            ),

          )
        ],
      ),
    );
  }
}