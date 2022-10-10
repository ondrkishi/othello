import 'package:flutter/material.dart';

import 'package:othello/app/othello/widget/cell.dart';

//マス目[OthelloCell]を表示するBoard
class OthelloBoard extends StatefulWidget {
  const OthelloBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<OthelloBoard> createState() => _OthelloBoardState();
}

enum Player {
  black,
  white,
}

enum SquareState {
  black,
  white,
  empty,
}

class _OthelloBoardState extends State<OthelloBoard> {
  //要素数64のリストを生成し初期値としてnullを与える
  final List<String?> _OthelloSquare = List.generate(64, (index) => null);

  //現在のプレイヤー
  Player nowPlayer = Player.black;
  int blackCount = 0;
  int whiteCount = 0;

  void countCell() {
    blackCount = _OthelloSquare.where((String? value) => value == 'B').toList().length;
    whiteCount = _OthelloSquare.where((String? value) => value == 'W').toList().length;
  }

  void handleClick(int i) {
    //すでに石が置かれている場合は何もしない
    if (_OthelloSquare[i] != null) return;

    //final squares = _OthelloSquare.sublist(0);
    if (nowPlayer == Player.black) {
      _OthelloSquare[i] = 'B';
      countCell();
    } else if (nowPlayer == Player.white) {
      _OthelloSquare[i] = 'W';
      countCell();
    }

    setState(() {
      //nowPlayerを交換する
      if (nowPlayer == Player.black) {
        nowPlayer = Player.white;
      } else {
        nowPlayer = Player.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nextPlayer = 'Next Player: ${nowPlayer == Player.black ? 'black' : 'white'}';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(nextPlayer, style: const TextStyle(fontSize: 25)),
        ),
        Container(
          color: const Color.fromARGB(223, 3, 110, 44),
          child: SizedBox(
            //マス目の大きさ
            height: 45 * 8,
            width: 45 * 8,
            //[GridView]マス目を作る
            //[.count]で常に正方形を表示する
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //1行に表示する数
              crossAxisCount: 8,
              //表示するSquareの数
              children: List.generate(
                  64,
                  (int i) => OthelloCell(
                        onTap: () => handleClick(i),
                        value:
                            //'$i' テキストを表示するだけの値
                            _OthelloSquare[i],
                      )),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('black:$blackCount', style: const TextStyle(fontSize: 25)),
                const Text('/', style: TextStyle(fontSize: 25)),
                Text('white:$whiteCount', style: const TextStyle(fontSize: 25))
              ],
            )),
      ],
    );
  }
}
