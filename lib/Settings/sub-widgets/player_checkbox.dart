import 'package:flutter/material.dart';

class PlayerCheckbox extends StatefulWidget {
  final int player;
  bool value;
  final Function checkboxChanged;

  PlayerCheckbox({this.player, this.value, this.checkboxChanged});

  @override
  _PlayerCheckboxState createState() => _PlayerCheckboxState();
}

class _PlayerCheckboxState extends State<PlayerCheckbox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: widget.value, 
            onChanged: (bool newVal) {
              setState(() {
                widget.value = widget.checkboxChanged(newVal, widget.player);
              });
            },
          ),
          Text (
            widget.player == 1 ? 'Top Clock' : 'Bottom Clock',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      )
    );
  }
}