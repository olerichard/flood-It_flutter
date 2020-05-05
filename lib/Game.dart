import 'package:flutter/material.dart';
import 'dart:math';

class GameState {
  final int _rows = 9;
  final int maxMoves = 30;

  final List<MaterialColor> colors;
  final int rowLength;
  int moves = 1;

  Random _random = Random();
  List<Row> board = List<Row>();
  VictoryConditions scoreResult = VictoryConditions.RUNNING;
  GameState({this.rowLength, this.colors}) {
    this.createBoard();
  }

  void createBoard() {
    for (var i = 0; i < _rows; i++) {
      Row row = new Row();
      row.tiles = new List<Tile>();

      for (var y = 0; y < this.rowLength; y++) {
        var color = _random.nextInt(colors.length);
        row.tiles.add(Tile(color: colors[color], collected: false));
      }

      board.add(row);
    }
  }

  void makeMove(MaterialColor color) {
    board = calculateMove(board, color);
    moves++;
    scoreResult = score();
  }

  List<Row> calculateMove(List<Row> newBoard, MaterialColor color) {
    for (var r = 0; r < newBoard.length; r++) {
      for (var t = 0; t < newBoard[r].tiles.length; t++) {
        if (newBoard[r].tiles[t].collected == true) {
          if (t - 1 >= 0) {
            if (newBoard[r].tiles[t - 1].color == color)
              newBoard[r].tiles[t - 1].collected = true;
          }
          if (t + 1 < newBoard[r].tiles.length) {
            if (newBoard[r].tiles[t + 1].color == color)
              newBoard[r].tiles[t + 1].collected = true;
          }

          if (r + 1 < newBoard.length) {
            if (newBoard[r + 1].tiles[t].color == color)
              newBoard[r + 1].tiles[t].collected = true;
          }
          if (r - 1 >= 0) {
            if (newBoard[r - 1].tiles[t].color == color) {
              if (newBoard[r - 1].tiles[t].collected != true) {
                newBoard[r - 1].tiles[t].collected = true;
                r = r > 1 ? r - 2 : 0;
                break;
              }
            }
          }
        }
      }
    }

    newBoard.forEach((r) {
      return r.tiles.forEach((l) {
        l.color = l.collected == true ? color : l.color;
      });
    });

    return newBoard;
  }

  VictoryConditions score() {
    if (checkWinner() && moves >= maxMoves) return VictoryConditions.WINNER;

    if (moves == maxMoves) return VictoryConditions.LOST;

    return VictoryConditions.RUNNING;
  }

  bool checkWinner() {
    for (var r = 0; r < board.length; r++) {
      for (var t = 0; t < board[r].tiles.length; t++) {
        if (board[r].tiles[t].collected == false) return false;
      }
    }
    return true;
  }
}

enum VictoryConditions { WINNER, LOST, RUNNING }

class Row {
  List<Tile> tiles;
}

class Tile {
  Tile({this.color, this.collected});

  MaterialColor color;
  bool collected;
}
