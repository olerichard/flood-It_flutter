import 'package:flutter/material.dart';
import 'dart:math';

import 'Board.dart';
import 'ColorPickerBar.dart';

void main() => runApp(MaterialApp(home: FloodIt()));

class FloodIt extends StatefulWidget {
  final int rowlength;

  FloodIt({this.rowlength});

  @override
  _FloodItState createState() => _FloodItState();
}

class _FloodItState extends State<FloodIt> {
  updateBoard(MaterialColor color) {
    print(color);
  }

  final List<MaterialColor> colors = const [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("01/15"),
      ),
      body: Board(colors: colors, random: random),
      bottomNavigationBar:
          ColorPickerBar(colors: colors, updateBoard: updateBoard),
    );
  }
}
