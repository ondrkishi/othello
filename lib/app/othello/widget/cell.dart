import 'package:flutter/material.dart';

//マス目
class OthelloCell extends StatelessWidget {
  const OthelloCell({
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
