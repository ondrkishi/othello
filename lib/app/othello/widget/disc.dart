import 'package:flutter/material.dart';

class OthelloDisc extends StatelessWidget {
  const OthelloDisc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (true) {
      return Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      );
    }
  }
}
