
import 'dart:async';

import 'package:chess_clock/Service/persist_data.dart';
import 'package:flutter/material.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import '../Common/classes/state.dart';
import 'sub-widgets/player-options.dart';
import 'sub-widgets/player-tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistData persistData;
  bool isGameRunning = true;
  int clockChecked = 0;
  bool hasLoaded = false;
  
  AppState currentState;
  AppState playerOneState;
  AppState playerTwoState;
  double playerOneCurrentTime;
  double playerTwoCurrentTime;

  double increments = 2;
  bool canPause = false;

  Timer playerOneTimer = new Timer(const Duration(milliseconds: 1000), () {});
  Timer playerTwoTimer = new Timer(const Duration(milliseconds: 1000), () {});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Clock',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Chess Clock'),
        ),
        body: Container(
          //decoration: new BoxDecoration(color: Colors.black),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: hasLoaded ? Column(
                children: <Widget>[
                  PlayerTab(1, pageClick, playerOneCurrentTime.ceilToDouble(), playerOneState.inFocus),
                  PlayerOptions(pageClick ,  adjustTimeSettings, currentState, canPause, clockChecked),
                  PlayerTab(2, pageClick, playerTwoCurrentTime.ceilToDouble(), playerTwoState.inFocus),
                ],
              ) : 
              Container(),
            ),
          ),
        ),
      )
    );
  }

  @override
  void initState() {
    print(persistData);
    //currentState = new AppState(60, 2);
    getStoredData();
    super.initState();
  }

  getStoredData() async {
    if (persistData == null) {
      persistData = await PersistData.getInstance();
    }
    playerOneState = persistData.loadPlayerOneState();
    playerTwoState = persistData.loadPlayerTwoState();
    print(playerOneState.defaultTime);
    print(playerOneState.increments);
    pageClick(-1);
    setState(() { currentState = playerOneState; hasLoaded = true; });
  }

  pageClick(int player) {
    if (isGameRunning && player == 2) {
      playerTwoTimer.cancel();
      if (!playerOneTimer.isActive) {
        incrementPlayer(2, playerTwoState.increments);
        playerOneTimer = startCountDown(1);
        setState(() { 
          playerTwoState.inFocus = false;
          playerOneState.inFocus = true;
        } );
      }
    } else if (isGameRunning && player == 1) {
      playerOneTimer.cancel();
      if (!playerTwoTimer.isActive) {
        incrementPlayer(1, playerOneState.increments);
        playerTwoTimer = startCountDown(2);
        setState(() { 
          playerTwoState.inFocus = true;
          playerOneState.inFocus = false;
        } );
      }
    } else {
      playerTwoTimer.cancel();
      playerOneTimer.cancel();
      setState(() { 
        canPause = false;
        playerTwoState.inFocus = false;
        playerOneState.inFocus = false;
      } );

      if (player == -1){
        setState(() {
          playerOneCurrentTime = playerOneState.defaultTime;
          playerTwoCurrentTime = playerTwoState.defaultTime;
        });
        isGameRunning = true;
      }
    }
  }

  
  startCountDown(int player) {
    
    setState(() { canPause = true; } );

    return new Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        player == 1 ? playerOneCurrentTime -= 0.05 : playerTwoCurrentTime -= 0.05;
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

  adjustTimeSettings(AppState state, int player) {
    clockChecked = player;
    currentState = state;
    if (player == 1) {
      playerOneState = state;
    } else if (player == 2){
      playerTwoState = state;
    } else {
      playerOneState = state;
      playerTwoState = state;
    }
    persistData.savePlayerOneState(playerOneState);
    persistData.savePlayerTwoState(playerTwoState);
    pageClick(-1);
  }

}
