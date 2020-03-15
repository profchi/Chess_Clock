import 'package:chess_clock/Common/classes/time-display.dart';
import 'package:chess_clock/Settings/widget-selector/up-down-selector.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final double currentTime;
  final double increments;
  final Function adjustTimeValues;

  TimeSelector({this.currentTime, this.increments, this.adjustTimeValues});

  @override
  _TimeSelectorState createState() => _TimeSelectorState(currentTime: currentTime, increments: increments);
}

class _TimeSelectorState extends State<TimeSelector> {
  double currentTime;
  double increments;
  String currentTimeText;
  String incrementText;

  static const double maxIncrements = 90;
  static const double maxCurrentTime = 5400;

  _TimeSelectorState({this.currentTime, this.increments});

  @override
  Widget build(BuildContext context) {
    incrementText = TimeDisplay.incrementConverter(increments);
    currentTimeText = TimeDisplay.timeConverter(currentTime);
    
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UpDownSelector(
                upPressed: () => adjustCurrentTime(60),
                downPressed: () => adjustCurrentTime(-60),
              ),
              Container(
                height: 80,
                width: 130,
                child: Card(
                  elevation: 3,
                  child: Text(
                    currentTimeText,
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              UpDownSelector(
                upPressed: () => adjustCurrentTime(1),
                downPressed: () => adjustCurrentTime(-1),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                height: 60,
                width: 60,
                child: Card(
                  elevation: 3,
                  child: Text(
                    incrementText,
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              UpDownSelector(
                upPressed: () => adjustIncrement(1),
                downPressed: () => adjustIncrement(-1),
              )
            ],
          )
        ],
      ),
    );
  }

  adjustCurrentTime(int val) {
    setState(() {
      currentTime += val;
      if (currentTime < 0 || currentTime > maxCurrentTime)
        currentTime %= maxCurrentTime;
    });
    widget.adjustTimeValues(currentTime, increments);
  }

  adjustIncrement(int val) {
    setState(() {
      increments += val;
      if (increments < 0 || increments > maxIncrements)
        increments %= maxIncrements;
    });
    widget.adjustTimeValues(currentTime, increments);
  }
}