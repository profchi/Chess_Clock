import 'package:chess_clock/Settings/settings.dart';
import 'package:chess_clock/widgets/clickable_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            child: Column(
              children: <Widget>[
                new ClickableWidget(
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(100.0),
                        child: Text('5:00',
                            style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    () {showToast(context, "Clicked, top clock");}),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new ClickableWidget(
                            Icon(
                              Icons.refresh,
                              color: Colors.blue,
                              size: 36.0,
                              semanticLabel: 'Reset timer',
                            ), () {
                          showToast(context, "Clicked reset");
                        }),
                        new ClickableWidget(
                            Icon(
                              Icons.pause,
                              color: Colors.redAccent,
                              size: 36.0,
                            ), () {
                          showToast(context, "Clicked pause");
                        }),
                        new ClickableWidget(
                            Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 36.0,
                            ), () {
                          showToast(context, "Clicked sttings");
                        }),
                      ],
                    )),
                new ClickableWidget(
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(100.0),
                        child: Text('5:00',
                            style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.blue,
                            )),
                      ),
                    ), () {
                  showToast(context, "Clicked, bottom clock");
                })
              ],
            ),
          ),
        ));
  }

  static showToast(BuildContext context, String text) {
    Fluttertoast.showToast(msg: text);
  }
}
