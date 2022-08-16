import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:othello/app/othello/widget/othello_board.dart';

void main() {
  runApp(const ProviderScope(child: OthelloGame()));
}
