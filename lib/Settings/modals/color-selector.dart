import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  static final colorTypes = [
    {"color": Colors.red, "name": "Red" },
    {"color": Colors.blue, "name": "Blue" },
    {"color": Colors.green, "name": "Green" },
    {"color": Colors.brown, "name": "Brown" },
    {"color": Colors.grey, "name": "Grey" },
    {"color": Colors.orange, "name": "Orange" },
    {"color": Colors.pink, "name": "Pink" },
    {"color": Colors.lightBlue, "name": "Light Blue" },
    {"color": Colors.transparent, "name": "Transparent" },
    {"color": Colors.purple, "name": "Purple" },
    {"color": Colors.amber, "name": "Amber" },
    {"color": Colors.lightGreen, "name": "Light Green" },
    {"color": Colors.lime, "name": "Lime" },
    {"color": Colors.teal, "name": "Teal" },
    {"color": Colors.indigo, "name": "Indigo" },
    {"color": Colors.white, "name": "White" },
    {"color": Colors.black, "name": "Black" },
    {"color": Colors.cyan, "name": "Cyan" },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: colorTypes.map((type) => 
          Container(
            padding: EdgeInsets.fromLTRB(0,10,0,10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: type['color']
                  ) ,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text (
                    type['name'],
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ).toList(),
      ),
    );
  }
}