import 'package:chess_clock/Settings/sub-widgets/player_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:chess_clock/Common/classes/state.dart';
import './sub-widgets/sub_header.dart';
import './sub-widgets/time_setter_area.dart';

class SettingsPage extends StatelessWidget {
  final AppState state;
  final Function adjustTime;
  final int clockChecked;

  SettingsPage(this.state, this.adjustTime, this.clockChecked);

  final playerCheckbox = [
    {'player': 1, 'value' : true },
    {'player': 2, 'value' : true }
  ];
  
  @override
  Widget build(BuildContext context) {
    initCheckBox();
    return MaterialApp(
      title: 'Chess Clock',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SubHeader('Time Adjuster'),
              TimeSetterArea(this.state),
              SubHeader('Changes Applied On'),
              Container(
                child: Column (
                  children: playerCheckbox.map(
                    (checkbox) => PlayerCheckbox(
                      player: checkbox['player'],
                      value: checkbox['value'],
                      checkboxChanged: checkboxChanged,
                    )
                  ).toList(),
                ),
              ),
              RaisedButton(
                onPressed: () => applyChanges(),
                child: Text('Apply Changes'),
              ),
            ],
          ),
        )
      ),
    );
  }

  applyChanges() {
    bool changePlayerOne = playerCheckbox[0]['value'];
    bool changePlayerTwo = playerCheckbox[1]['value'];

    int player;
    if (changePlayerTwo && changePlayerOne) {
      player = 0;
    } else if (changePlayerOne) {
      player = 1;
    } else if (changePlayerTwo) {
      player = 2;
    }

    adjustTime(state, player);
  }

  checkboxChanged(bool newVal, int player) {
    int playerIndex = player - 1;
    int secondPlayerIndex = playerIndex == 0 ? 1 : 0;

    if (!newVal && !playerCheckbox[secondPlayerIndex]['value']) {
      return true;
    } else {
      playerCheckbox[playerIndex]['value'] = newVal;
      return newVal;
    }
  }

  initCheckBox () {
    playerCheckbox[0]['value'] = clockChecked == 0 || clockChecked == 1;
    playerCheckbox[1]['value'] = clockChecked == 0 || clockChecked == 2;
  }
}