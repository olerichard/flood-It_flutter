import 'package:flood_it/Game.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({this.gameState});

  final GameState gameState;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: gameState.rowLength,
        children: gameState.board.expand((row) {
          return row.tiles;
        }).map((tile) {
          return _createTile(tile.color);
        }).toList());
  }
}

Widget _createTile(MaterialColor color) {
  return Container(
    color: color,
    padding: EdgeInsets.all(0.0),
    margin: EdgeInsets.all(0.0),
  );
}
