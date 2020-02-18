import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
  ClickableWidget(this.widget, this.onTap, {Key key}) : super(key: key);

  final Widget widget;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: widget,
    );
  }
}
