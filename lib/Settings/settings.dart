import 'package:flutter/material.dart';
import './sub-widgets/sub_header.dart';
import './sub-widgets/color_settings.dart';
import './sub-widgets/time_setter_area.dart';

class SettingsPage extends StatelessWidget {

  final colorSetting = [
    'Background',
    'Color When turn',
    'Color When not turn'
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Clock',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SubHeader('Standard Time Control'),
              TimeSetterArea(),
              SubHeader('Theme'),
              Column (
                children: colorSetting.map((text) => ColorSettings(text)).toList(),
              )
            ],
          ),
        )
      ),
    );
  }
}