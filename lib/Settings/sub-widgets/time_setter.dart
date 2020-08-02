import 'package:flutter/material.dart';

enum SetterTypes {
  base, 
  increments
}

class TimeSetter extends StatelessWidget {

  final int type;
  final String display;

  TimeSetter({this.type, this.display});
  
  @override
  Widget build(BuildContext context) {
    double width = type == SetterTypes.base.index ? 90 : 45;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          width: width,
          child: Card(
            elevation: 0,
            child: Text(
              display,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}