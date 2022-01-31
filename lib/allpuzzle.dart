
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';





import 'memorygame/mainme.dart';
import 'slidingpuzzle/home.dart';
import 'tictac/first.dart';

import 'words/wordFind.dart';




class all extends StatelessWidget {

  Widget build(BuildContext context) {
    //final appTitle = 'LOGIN PAGE';


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Center(

          child: Scaffold(

            appBar: AppBar(


              centerTitle: true,
              toolbarHeight: 60.2,

              elevation: 10.00,

              backgroundColor: Colors.black,

              title: RichText(

                text:TextSpan(

                    children: <TextSpan>[
                      TextSpan(
                        text:'W',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,

                          fontStyle: FontStyle.italic,fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      TextSpan(
                        text:'E',
                        style:TextStyle(
                          color: Colors.deepOrangeAccent,

                          fontStyle: FontStyle.italic,fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      TextSpan(
                        text:'L',
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
                          color: Colors.white,

                          fontStyle: FontStyle.italic,fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      TextSpan(
                        text:'O',
                        style:TextStyle(
                          color: Colors.white,

                          fontStyle: FontStyle.italic,fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      TextSpan(
                        text:'M',
                        style:TextStyle(
                          color: Colors.green,

                          fontStyle: FontStyle.italic,fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      TextSpan(
                        text:'E',
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
            body: MyCustomForm(),

          ),
        ),
      ),
    );
  }
}


class MyCustomForm extends StatefulWidget {

  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation;
  AnimationController animationControllere;

  void initState() {
    super.initState();
    animationControllere =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationControllere, curve: Curves.bounceIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationControllere,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    animationControllere.forward();




  }
  Future<bool> _onbackpressed(){
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit the app"),
          actions: [
            FlatButton(
              child: Text("No"),
              onPressed: ()=>Navigator.pop(context,false),

            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=>Navigator.pop(context,true),

            ),


          ],
        )
    );


  }


  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return WillPopScope(
      onWillPop: _onbackpressed,
      child: AnimatedBuilder(

          animation: animationControllere,
          builder: (BuildContext context,Widget child) {
            return  Container(

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

              child:  Center(


                child: Padding(
                  padding: const EdgeInsets.all(100.0),

                  child: SizedBox(

                    child: Transform(

                      transform: Matrix4.translationValues(
                          animation.value * width, 10.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [


                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.black,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Account()),
                              );
                            },
                            child: (Text("Sliding puzzle",
                              style: TextStyle(
                                color: Colors.red,
                                letterSpacing: 2.0,
                                wordSpacing: 3,

                              ),


                            )
                            ),
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.black,
                            child: (Text("Tic-tac-toe",
                              style: TextStyle(
                                color: Colors.red,
                                letterSpacing: 4.0,
                                wordSpacing: 5,

                              ),


                            )
                            ),

                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tictac()),
                              );
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.black,
                            child: (Text("Picture quiz",
                              style: TextStyle(
                                color: Colors.red,
                                letterSpacing: 2.0,
                                wordSpacing: 3,


                              ),


                            )
                            ),

                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WordFind()),
                              );
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.black,
                            child: (Text("Memory games",
                              style: TextStyle(
                                color: Colors.red,
                                letterSpacing: 2.0,
                                wordSpacing: 3,

                              ),


                            )
                            ),

                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => memory()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ),
            );
          }
      ),
    );

  }
}

