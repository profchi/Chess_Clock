
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import 'sub-widgets/player-options.dart';
import 'sub-widgets/player-tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Clock',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chess Clock'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PlayerTab(true),
                PlayerOptions(),
                PlayerTab(false),
              ],
            ),
          ),
        ),
      )
    );
  }
}
