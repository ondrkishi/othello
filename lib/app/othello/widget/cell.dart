import 'package:flutter/material.dart';

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
        //child: Center(child: _buildItem(table[x][y])),
      ),
    );
  }

  //石の色分け
  Widget? _othelloDiscJudg(BuildContext context, var value) {
    if (value == "B") {
      return _othelloDisc(context, Colors.black);
    } else if (value == "W") {
      return _othelloDisc(context, Colors.white);
    }
    return null;
  }

  //石のUI
  Widget _othelloDisc(BuildContext context, Color color) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
