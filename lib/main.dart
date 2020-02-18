import 'package:flutter/material.dart';
import './Home/homepage.dart';
import './Settings/settings.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => HomePage(),
      '/settings': (BuildContext context) => SettingsPage()
    }));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
