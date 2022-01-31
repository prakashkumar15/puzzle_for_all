
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/allpuzzle.dart';

import 'package:untitled/memorygame/components/info_card.dart';


import 'utils/game_utils.dart';


class memory extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,


      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
backgroundColor: Colors.black,
  centerTitle: true,
  leading: IconButton(
    icon: Icon(Icons.keyboard_backspace_sharp),
    iconSize: 35,

    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => all()),
      );

    },

  ),
  title: RichText(


    text:TextSpan(

        children: <TextSpan>[
          TextSpan(
            text:'I',
            style: TextStyle(
              color: Colors.deepOrangeAccent,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),
          TextSpan(
            text:'Q',
            style:TextStyle(
              color: Colors.deepOrangeAccent,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),
          TextSpan(
            text:'H',
            style:TextStyle(
              color: Colors.white,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),
          TextSpan(
            text:'A',
            style:TextStyle(
              color: Colors.white,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),
          TextSpan(
            text:'C',
            style:TextStyle(
              color: Colors.green,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),
          TextSpan(
            text:'K',
            style:TextStyle(
              color: Colors.green,

              fontStyle: FontStyle.italic,fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,

            ),
          ),

        ]
    ),
  ),

),
      body: Container(

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [


            SizedBox(
              height: 24.0,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                info_card("Tries", "$tries"),
                info_card("Score", "$score"),

              ],
            ),

            SizedBox(

                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    itemCount: _game.gameImg.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    padding: EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(_game.matchCheck);
                          setState(() {
                            //incrementing the clicks
                            tries++;
                            _game.gameImg[index] = _game.cards_list[index];
                            _game.matchCheck
                                .add({index: _game.cards_list[index]});
                            print(_game.matchCheck.first);
                          });
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              print("true");
                              //incrementing the score
                              score += 100;
                              _game.matchCheck.clear();
                            } else {
                              print("false");

                              Future.delayed(Duration(milliseconds: 500), () {
                                print(_game.gameColors);
                                setState(() {
                                  _game.gameImg[_game.matchCheck[0].keys.first] =
                                      _game.hiddenCardpath;
                                  _game.gameImg[_game.matchCheck[1].keys.first] =
                                      _game.hiddenCardpath;
                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        },
                        child: Expanded(

                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFB46A),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(_game.gameImg[index]),
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),

                        ),

                      );

                    })


            )


          ],

        ),
      ),
    );
  }

}
