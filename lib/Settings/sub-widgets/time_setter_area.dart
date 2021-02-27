import 'package:chess_clock/Common/classes/state.dart';
import 'package:chess_clock/Common/classes/time-display.dart';
import 'package:flutter/material.dart';

import 'time_setter.dart';
import '../modals/time-selector.dart';
import '../modals/standard-time-selector.dart';

class TimeSetterArea extends StatefulWidget {
  final AppState state;
  TimeSetterArea (this.state); 
  @override
  _TimeSetterAreaState createState() => _TimeSetterAreaState(state.defaultTime, state.increments);
}

class _TimeSetterAreaState extends State<TimeSetterArea> {
  final String base = 'Base(mins)';
  final String increments = 'Inc(secs)';

  double currentTime;
  double increment;

  _TimeSetterAreaState(this.currentTime, this.increment);

  @override
  Widget build(BuildContext context) {

    String currentTimeText = TimeDisplay.timeConverter(currentTime);
    String incrementText = TimeDisplay.incrementConverter(increment);

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            onPressed:  () => showStandardTimeSelector(context),
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    //padding: EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(base),
                        TimeSetter(
                          type: SetterTypes.base.index, 
                          display: currentTimeText,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(increments),
                        TimeSetter(
                          type: SetterTypes.increments.index,
                          display: incrementText,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded (
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_drop_down
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
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
      useRootNavigator: true, 
      builder: (context) => TimeSelector(
        currentTime: currentTime, 
        increments: increment, 
        adjustTimeValues: adjustTimeValues,),
    );
  }

  showStandardTimeSelector(BuildContext context) {
   showModalBottomSheet(
      context: context,
      useRootNavigator: true, 
      builder: (context) => StandardTimeSelector(changeStandardTime),
    );
  }

  changeStandardTime( String val) {
    var selectedTimes = val.split("|");
    setState(() {
      currentTime = double.parse(selectedTimes[0]) * 60;
      increment =  double.parse(selectedTimes[1]);
    });
    widget.state.defaultTime = currentTime;
    widget.state.increments = increment;
  }

  adjustTimeValues (double curr, double inc ) {
    widget.state.defaultTime = curr;
    widget.state.increments = inc;
    setState(() {
      currentTime = curr;
      increment = inc;
    });
  }
}