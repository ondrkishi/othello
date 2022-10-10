import 'package:flutter/material.dart';

import 'package:othello/app/othello/widget/cell.dart';
import 'package:othello/app/othello/process/check.dart';

enum Player {
  // 黒
  black,
  // 白
  white,
}

enum CellType {
  // 石がある
  exists,
  // 何もない
  empty,
  // 石を置ける
  canPut,
}

class CellState {
  CellState({this.cellType = CellType.empty, this.owner});

  CellType cellType;
  Player? owner;
}

class Coordinate {
  Coordinate({required this.x, required this.y});

  int x;
  int y;
}

// cellの状態を持たせるlist
List<List<CellState>> table = List.generate(
  8,
  (index) => List<CellState>.generate(
    8,
    ((index) => (CellState(cellType: CellType.empty))),
  ),
);

// 現在のプレイヤー（最初は黒）
Player nowPrayer = Player.black;

//マス目[OthelloCell]を表示するBoard
class OthelloBoard extends StatefulWidget {
  const OthelloBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<OthelloBoard> createState() => _OthelloBoardState();
}

class _OthelloBoardState extends State<OthelloBoard> {
  @override
  // [initState] = Widgetが作成されたタイミングで処理をする
  void initState() {
    initStartCellState();
    super.initState();
  }

  /// 初期状態を作る
  void initStartCellState() {
    // 最初の石の状態を作る
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (i == 3 && j == 3 || i == 4 && j == 4) {
          // 最初に黒を置いているところ
          table[i][j] = CellState(cellType: CellType.exists, owner: Player.black);
        } else if (i == 3 && j == 4 || i == 4 && j == 3) {
          // 最初に白を置いているところ
          table[i][j] = CellState(cellType: CellType.exists, owner: Player.white);
        } else {
          // その他
          table[i][j] = CellState(cellType: CellType.empty, owner: null);
        }
      }
    }
    _searchCanPut();
  }

  /// 石を置いた時の処理
  void _handleClick(int x, int y) {
    if (table[x][y].cellType != CellType.canPut) {
      return;
    } else {
      setState(() {
        List<Coordinate> canSwhichList = pasteItemToTable(x, y, nowPrayer);
        if (nowPrayer == Player.black) {
          table[x][y] = CellState(cellType: CellType.exists, owner: Player.black);
          if (canSwhichList.isNotEmpty) {
            for (int i = 0; i < canSwhichList.length; i++) {
              table[canSwhichList[i].x][canSwhichList[i].y] = CellState(cellType: CellType.exists, owner: Player.black);
            }
          }
          nowPrayer = Player.white;
        } else {
          table[x][y] = CellState(cellType: CellType.exists, owner: Player.white);
          if (canSwhichList.isNotEmpty) {
            for (int i = 0; i < canSwhichList.length; i++) {
              table[canSwhichList[i].x][canSwhichList[i].y] = CellState(cellType: CellType.exists, owner: Player.white);
            }
          }
          nowPrayer = Player.black;
        }
        _searchCanPut();
      });
    }
  }

  /// 置けるマスをチェックする
  void _searchCanPut() {
    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        List<Coordinate> canPutCellList = pasteItemToTable(x, y, nowPrayer);
        if (table[x][y].owner == null) {
          table[x][y] = CellState(cellType: CellType.empty, owner: null);
        }
        if (canPutCellList.isNotEmpty) {
          if (table[x][y].owner == null) {
            table[x][y] = CellState(cellType: CellType.canPut, owner: null);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(223, 3, 110, 44),
          child: _buildBoard(),
        ),
      ],
    );
  }

  Widget _buildBoard() {
    return Column(
      children: [
        ...List.generate(
          8,
          (x) => Row(
            children: [
              ...List.generate(
                8,
                (y) => OthelloCell(
                  onTap: () => _handleClick(x, y),
                  x: x,
                  y: y,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
