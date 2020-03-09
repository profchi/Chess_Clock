import 'package:flutter/material.dart';

import 'time_setter.dart';

class TimeSetterArea extends StatelessWidget {

  final String base = 'Base Time';
  final String increments = 'Increments';
  
  static final setterTypes = {
    "default": "default",
    "custom": "custom"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(3),
            child: Column(
              children: <Widget>[
                Text(base),
                TimeSetter(SetterTypes.base.index)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(increments),
                TimeSetter(SetterTypes.increments.index)
              ],
            ),
          ),
        ],
      )
    );
  }
}