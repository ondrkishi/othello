import 'package:flutter/material.dart';
import 'package:othello/app/othello/widget/board.dart';

class OthelloDisc extends StatelessWidget {
  const OthelloDisc({
    Key? key,
    required this.cellState,
  }) : super(key: key);

  final CellState cellState;

  @override
  Widget build(BuildContext context) {
    return _buildItem(context, cellState);
  }

  /// マス目に表示するアイテムを作る
  Widget _buildItem(BuildContext context, CellState cellState) {
    if (cellState.cellType == CellType.exists) {
      if (cellState.owner == Player.black) {
        return _buildDisk(context, Colors.black);
      } else if (cellState.owner == Player.white) {
        return _buildDisk(context, Colors.white);
      }
    } else if (cellState.cellType == CellType.canPut) {
      return _canPutDisk(context);
    }
    return const SizedBox.shrink();
  }

  /// 石(白/黒)を作る
  Widget _buildDisk(BuildContext context, Color color) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  /// 置ける状態の見た目を作る
  Widget _canPutDisk(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
