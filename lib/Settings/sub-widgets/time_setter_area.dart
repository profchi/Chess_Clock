import 'package:chess_clock/Common/classes/time-display.dart';
import 'package:flutter/material.dart';

import 'time_setter.dart';
import '../modals/time-selector.dart';

class TimeSetterArea extends StatefulWidget {
  @override
  _TimeSetterAreaState createState() => _TimeSetterAreaState(currentTime: 300, increment: 5);
}

class _TimeSetterAreaState extends State<TimeSetterArea> {
  final String base = 'Base Time';
  final String increments = 'Increments';

  double currentTime;
  double increment;

  _TimeSetterAreaState({this.currentTime, this.increment});

  @override
  Widget build(BuildContext context) {

    String currentTimeText = TimeDisplay.timeConverter(currentTime);
    String incrementText = TimeDisplay.incrementConverter(increment);

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3),
                child: Column(
                  children: <Widget>[
                    Text(base),
                    TimeSetter(
                      type: SetterTypes.base.index, 
                      display: currentTimeText,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(increments),
                    TimeSetter(
                      type: SetterTypes.increments.index,
                      display: incrementText,
                    )
                  ],
                ),
              ),
            ],
          )
        ),
        RaisedButton(
          onPressed: () => showTimeSelector(context),
          child: Text('Set Custom Time'),
        ),
      ],
    );
  }

  showTimeSelector(BuildContext context) {
   showModalBottomSheet(
      context: context, 
      builder: (context) => TimeSelector(
        currentTime: currentTime, 
        increments: increment, 
        adjustTimeValues: adjustTimeValues,),
    );
  }

  adjustTimeValues (double curr, double inc ) {
    setState(() {
      currentTime = curr;
      increment = inc;
    });
  }
}