
import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import 'sub-widgets/player-options.dart';
import 'sub-widgets/player-tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGameRunning = true;

  final double defaultTime = 60;
  double playerOneCurrentTime = 300;
  double playerTwoCurrentTime = 300;

  double increments = 2;
  bool canPause = false;

  Timer playerOneTimer = new Timer(const Duration(milliseconds: 1000), () {});
  Timer playerTwoTimer = new Timer(const Duration(milliseconds: 1000), () {});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Clock',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chess Clock'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PlayerTab(1, pageClick, playerOneCurrentTime),
                PlayerOptions(pageClick , canPause),
                PlayerTab(2, pageClick, playerTwoCurrentTime),
              ],
            ),
          ),
        ),
      )
    );
  }

  pageClick(int player) {
    if (isGameRunning && player == 2) {
      playerTwoTimer.cancel();
      if (!playerOneTimer.isActive) {
        incrementPlayer(2, increments);
        playerOneTimer = startCountDown(1);
      }
    } else if (isGameRunning && player == 1) {
      playerOneTimer.cancel();
      if (!playerTwoTimer.isActive) {
        incrementPlayer(1, increments);
        playerTwoTimer = startCountDown(2);
      }
    } else {
      playerTwoTimer.cancel();
      playerOneTimer.cancel();
      setState(() { canPause = false; } );
      if (player == -1){
        setState(() {
          playerOneCurrentTime = defaultTime;
          playerTwoCurrentTime = defaultTime;
        });
        isGameRunning = true;
      }
    }
  }

  
  startCountDown(int player) {
    
    setState(() { canPause = true; } );

    return new Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        player == 1 ? playerOneCurrentTime-- : playerTwoCurrentTime--;
        if (playerOneCurrentTime == 0 || playerTwoCurrentTime == 0) canPause = false;
      });

      if (playerOneCurrentTime == 0 || playerTwoCurrentTime == 0) {
        isGameRunning = false;
        playerTwoTimer.cancel();
        playerOneTimer.cancel();
      }

    });
  }

  incrementPlayer(int player, double increment) {
    
    setState(() {
      if (player == 1) {
        playerOneCurrentTime += increment;
      } else if (player == 2) {
        playerTwoCurrentTime += increment;
      }
    });
  }
}
