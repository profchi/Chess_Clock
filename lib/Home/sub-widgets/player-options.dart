import 'package:flutter/material.dart';

import '../sub-widgets/player-icon.dart';
import '../../Settings/settings.dart';

class PlayerOptions extends StatefulWidget {
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
          !isPaused ?
          PlayerIcon(
            icon: Icons.pause, 
            clickFunction: togglePlayPause,
          ) :
          PlayerIcon(
            icon: Icons.play_arrow, 
            clickFunction: togglePlayPause,
          ),
          PlayerIcon(
            icon: Icons.settings, 
            clickFunction: clickedSettings,
          ),
        ],
      )
    );
  }

  clickedReset() {}

  togglePlayPause() {
    setState(() {
      isPaused = !isPaused;
    });
  }


  clickedSettings() {
    Navigator.push( 
      context, 
      MaterialPageRoute(builder: (_) => SettingsPage()),
    );
  }
}