import 'package:flutter/material.dart';

import 'package:othello/app/othello/widget/board.dart';
import 'package:othello/app/othello/widget/disc.dart';

//マス目
class OthelloCell extends StatelessWidget {
  const OthelloCell({
    Key? key,
    required this.onTap,
    required this.x,
    required this.y,
  }) : super(key: key);

  final void Function() onTap;
  final int x;
  final int y;

  @override
  Widget build(BuildContext context) {
    // 端末の画面サイズからマス目の大きさを計算
    late final double cellSize = MediaQuery.of(context).size.width / 8.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(223, 3, 110, 44),
          border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 0.1,
          ),
        ),
        width: cellSize,
        height: cellSize,
        child: Center(child: OthelloDisc(cellState: table[x][y])),
      ),
    );
  }
}
