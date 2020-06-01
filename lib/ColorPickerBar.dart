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
        children: colors
            .map((color) => FlatButton(
                color: color,
                shape: CircleBorder(),
                onPressed: () {
                  updateBoard(color);
                },
                child: Text("")))
            .toList());
  }
}
