import 'package:flood_it/Game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Board.dart';
import 'ColorPickerBar.dart';

void main() => runApp(FloodIt());

class FloodIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  updateBoard(MaterialColor color) {
    gameState.makeMove(color);
  }

  static int rowLength = 7;
  static List<MaterialColor> colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple
  ];
  Random random = Random();

  GameState gameState = new GameState(rowLength: rowLength, colors: colors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${gameState.moves.toString()}/${gameState.maxMoves.toString()}"),
      ),
      body: Board(gameState: gameState),
      bottomNavigationBar:
          ColorPickerBar(colors: gameState.colors, updateBoard: updateBoard),
    );
  }
}
