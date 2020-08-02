import 'package:flutter/material.dart';

class StandardTimeSelector extends StatelessWidget {
  static final timeOptions = ["1|0", "2|1" , "3|0", "3|2" , "5|0" , "5|5", "10|0", "15|10", "30|0"];

  final Function adjustTimeValues;

  StandardTimeSelector(this.adjustTimeValues);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: timeOptions.map((time) => 
        RaisedButton(
          onPressed: () => updateTime(time, context),
          child: Text(time),
        )
      ).toList() ,
    );
  }

  updateTime(String time, BuildContext context ) {
    this.adjustTimeValues(time);
    Navigator.pop(context);
  }
}