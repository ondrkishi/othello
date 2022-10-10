import 'package:flutter/material.dart';

import 'package:othello/app/othello/widget/board.dart';

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
