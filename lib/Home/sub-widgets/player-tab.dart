import 'package:flutter/material.dart';

import 'dart:math';

class PlayerTab extends StatelessWidget {
  final bool inverted;

  PlayerTab(this.inverted);

  @override
  Widget build(BuildContext context) {
    double angleRotated = inverted ? pi : 0;
    return RaisedButton(
      child: Padding(
        padding: EdgeInsets.all(60.0),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(angleRotated),
            child: Text('5:00',
              style: new TextStyle(
                fontSize: 80.0,
                color: Colors.blue,
              )
            ),
          ),
        ),
      onPressed: () {},
    ); 
  }
}