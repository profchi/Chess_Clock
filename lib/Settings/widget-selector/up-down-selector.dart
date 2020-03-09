import 'package:flutter/material.dart';

class UpDownSelector extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: null, 
          child: Icon(Icons.keyboard_arrow_up),
        ),
        FlatButton(
          onPressed: null, 
          child: Icon(Icons.keyboard_arrow_down),
        )
      ],
    );
  }
}