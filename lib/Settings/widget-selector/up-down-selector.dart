import 'package:flutter/material.dart';

class UpDownSelector extends StatelessWidget {

  final Function upPressed;
  final Function downPressed;

  UpDownSelector({this.upPressed, this.downPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: upPressed, 
          child: Icon(Icons.keyboard_arrow_up),
        ),
        FlatButton(
          onPressed: downPressed, 
          child: Icon(Icons.keyboard_arrow_down),
        )
      ],
    );
  }
}