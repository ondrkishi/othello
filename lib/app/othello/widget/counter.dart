import 'package:flutter/material.dart';

import 'package:othello/app/othello/widget/board.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.countItemBlack,
    required this.countItemWhite,
    required this.nowPrayer,
  });

  final int countItemBlack;
  final int countItemWhite;
  final Player nowPrayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            _buildCellMark(Colors.black),
            if (nowPrayer == Player.black) _nowPlayreMark(),
          ],
        ),
        Text(
          '$countItemBlack - $countItemWhite',
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 32),
        ),
        Column(
          children: [
            _buildCellMark(Colors.white),
            if (nowPrayer == Player.white) _nowPlayreMark(),
          ],
        ),
      ],
    );
  }

  /// cellのマーク(黒)
  Widget _buildCellMark(Color color) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
  }

  /// 現在のプレイヤーを示すマーク
  Widget _nowPlayreMark() {
    return Container(
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
