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

  double currentTimeSlider;


  
  String currentTimeText;
  String incrementText;

  _TimeSelectorState({this.currentTime, this.increments});

  @override
  Widget build(BuildContext context) {
    currentTimeSlider = currentTime / 60;
    currentTimeText = "Base Time: " + currentTimeSlider.toInt().toString() + " min(s)";
    incrementText = "Increments: " + increments.toInt().toString() + " sec(s)"; 
    
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text (
            currentTimeText
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("1")
                ),
                Expanded(
                  flex: 8,
                  child: Slider(
                    min: 1.0,
                    max: 90.0,
                    value: currentTimeSlider,
                    divisions: 89,
                    onChanged: (double val) => adjustCurrentTime(val), 
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("90")
                ),
              ],
            ),
          ),

          Text (
            incrementText
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("0")
                ),
                Expanded(
                  flex: 8,
                  child: Slider(
                    min: 0.0,
                    max: 60.0,
                    value: increments,
                    divisions: 60,
                    onChanged: (double val) => adjustIncrement(val), 
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("60")
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  adjustCurrentTime(double val) {
    setState(() {
      currentTimeSlider = val;
      currentTime = (val * 60).roundToDouble();
    });
    widget.adjustTimeValues(currentTime, increments);
  }

  adjustIncrement(double val) {
    setState(() {
      increments = val;
    });
    widget.adjustTimeValues(currentTime, increments);
  }
}