import 'package:chess_clock/Settings/widget-selector/up-down-selector.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UpDownSelector(),
              Container(
                height: 80,
                width: 130,
                child: Card(
                  elevation: 3,
                  child: Text(
                    '05:00',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              UpDownSelector()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                height: 60,
                width: 60,
                child: Card(
                  elevation: 3,
                  child: Text(
                    '00',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              UpDownSelector()
            ],
          )
        ],
      ),
    );
  }
}