import 'package:chess_clock/Common/classes/time-display.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class PlayerTab extends StatelessWidget {
 
  final int player;
  final Function homePageWidgetClick;
  final double currentTime;
  final bool inFocus;

  PlayerTab(this.player, this.homePageWidgetClick, this.currentTime, this.inFocus);

  @override
  Widget build(BuildContext context) {
    double angleRotated = player == 1 ? pi : 0;
    Color color = inFocus ? Colors.amber : Colors.grey;

    return Container(
      child: RaisedButton(
        color: color,
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0,60.0,40.0,60.0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(angleRotated),
              child: Text(TimeDisplay.timeConverter(currentTime),
                style: new TextStyle(
                  fontSize: 80.0,
                  color: Colors.blue,
                )
              ),
            ),
          ),
        onPressed: () => homePageWidgetClick(player),
      ),
    ); 
  }

}