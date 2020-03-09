import 'package:flutter/material.dart';

enum SetterTypes {
  base, 
  increments
}

class TimeSetter extends StatelessWidget {

  final int type;
  TimeSetter(this.type);
  
  @override
  Widget build(BuildContext context) {
    String text = type == SetterTypes.base.index ? "05:00" : "10";
    double width = type == SetterTypes.base.index ? 90 : 45;
    
    return Row(
      children: <Widget>[
        Icon(
          Icons.remove,
        ),
        Container(
          height: 40,
          width: width,
          child: Card(
            elevation: 3,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        Icon(
          Icons.add,
        ),
      ],
    );
  }
}