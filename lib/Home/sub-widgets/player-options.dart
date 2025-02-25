import 'package:chess_clock/Common/classes/state.dart';
import 'package:flutter/material.dart';

import '../sub-widgets/player-icon.dart';
import '../../Settings/settings.dart';

class PlayerOptions extends StatefulWidget {
  final Function homePageWidgetClick;
  final Function timeAdjusted;
  final AppState appState;
  final bool canPause;
  final int clockChecked;

  PlayerOptions(this.homePageWidgetClick, this.timeAdjusted, this.appState, this.canPause, this.clockChecked);

  @override
  _PlayerOptionsState createState() => _PlayerOptionsState();
}

class _PlayerOptionsState extends State<PlayerOptions> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          PlayerIcon(
            icon: Icons.refresh, 
            clickFunction: clickedReset,
          ),
          widget.canPause?
          PlayerIcon(
            icon: Icons.pause, 
            clickFunction: clickedPause,
          ) : 
          Container(), 
          PlayerIcon(
            icon: Icons.settings, 
            clickFunction: clickedSettings,
          ),
        ],
      )
    );
  }

  clickedReset() {
    widget.homePageWidgetClick(-1);
  }

  clickedPause() {
    widget.homePageWidgetClick(0);
  }


  clickedSettings() {
    print(widget.appState.defaultTime);
    print(widget.appState.increments);
    Navigator.push( 
      context, 
      MaterialPageRoute(builder: (_) => SettingsPage(
                    new AppState(widget.appState.defaultTime, widget.appState.increments),
                    widget.timeAdjusted,
                    widget.clockChecked
        )
      )
    );
    widget.homePageWidgetClick(0);
  }
}