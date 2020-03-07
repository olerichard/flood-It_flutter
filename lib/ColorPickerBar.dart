import 'package:flutter/material.dart';

class ColorPickerBar extends StatelessWidget {
  const ColorPickerBar({this.colors, this.updateBoard});

  final Function updateBoard;
  final List<MaterialColor> colors;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
        buttonMinWidth: 55.0,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var color in colors)
            FlatButton(
                color: color,
                shape: CircleBorder(),
                onPressed: () {
                  updateBoard(color);
                },
                child: Text("")),
        ]);
  }
}
