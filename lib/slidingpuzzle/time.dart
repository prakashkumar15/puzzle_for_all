import 'package:flutter/material.dart';
class Time extends StatelessWidget {

  int secondsPassed;

  Time(this.secondsPassed);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[400],
            ],
          ),
        ),
        child: Container(

          child: Text(
            "Time: ${secondsPassed}",
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.none,
              color: Colors.white,

            ),
          ),
        ),

      ),
    );
  }
}
//"Time: ${secondsPassed}",