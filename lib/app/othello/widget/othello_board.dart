import 'package:flutter/material.dart';

//マス目
class OthelloSquare extends StatelessWidget {
  const OthelloSquare({
    Key? key,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  final void Function() onTap;
  final String? value;

  @override
  Widget build(BuildContext context) {
    //タップの入力検知
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //マス目の区切り線
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 0.1),
        ),
        child: Center(
            //マス目の中に表示するもの
            child:
                //Text(value!),
                _othelloDiscJudg(context, value)),
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

//マス目[OthelloSquare]を表示するBoard
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
                  (int i) => OthelloSquare(
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

//盤面[OthelloBoard]を表示するGame
class OthelloGame extends StatelessWidget {
  const OthelloGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Otello'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const OthelloBoard(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(children: const []),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
