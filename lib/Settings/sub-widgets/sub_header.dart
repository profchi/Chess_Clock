import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final String headerText;

  SubHeader(this.headerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        headerText,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(20.0),
    );
  }
}