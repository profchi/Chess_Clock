import 'package:flutter/material.dart';

class PlayerIcon extends StatelessWidget {
  final IconData icon;
  final Function clickFunction; 
  
  PlayerIcon({this.icon, this.clickFunction});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Icon(
        this.icon,
        color: Colors.blue,
        size: 36.0,
      ),
      onPressed: clickFunction,
    );
  }
}