import 'package:flutter/material.dart';

import '../modals/color-selector.dart';

class ColorSettings extends StatelessWidget {
  final String title;

  ColorSettings(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,0,0),
      child: FlatButton(
        onPressed: () => showColorSelector(context),
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
              ) ,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10,0,0,0),
              child: Text (
                title,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),    
    );
  }

  showColorSelector(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_) => ColorSelector(),
    );
  }
}