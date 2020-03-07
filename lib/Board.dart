import 'dart:math';

import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({this.colors, this.random});

  final List<MaterialColor> colors;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 7,
      children: <Widget>[
        for (var i = 0; i < (63); i++)
          Container(
            color: colors[random.nextInt(6)],
          ),
      ],
    );
  }
}
