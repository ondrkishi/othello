import 'package:flutter/material.dart';

/// ひっくり返せるものがあるかどうかをチェックする

import 'package:othello/app/othello/widget/board.dart';

/// 石を置けるかどうかの判定
List<Coordinate> pasteItemToTable(int x, int y, Player nowPrayer) {
  List<Coordinate> listCoordinate = [];
  listCoordinate.addAll(checkRight(x, y, nowPrayer));
  listCoordinate.addAll(checkDown(x, y, nowPrayer));
  listCoordinate.addAll(checkLeft(x, y, nowPrayer));
  listCoordinate.addAll(checkUp(x, y, nowPrayer));
  listCoordinate.addAll(checkUpLeft(x, y, nowPrayer));
  listCoordinate.addAll(checkUpRight(x, y, nowPrayer));
  listCoordinate.addAll(checkDownLeft(x, y, nowPrayer));
  listCoordinate.addAll(checkDownRight(x, y, nowPrayer));
  return listCoordinate;
}

/// 右側
List<Coordinate> checkRight(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (y + 1 < 8) {
    // 盤面の中
    for (int c = y + 1; c < 8; c++) {
      if (table[x][c].owner == nowPrayer) {
        // ヒットしている状態で自分の石が見つかったらlistを返してチェック終了
        if (hit) return list;
        // ヒットしていない状態で自分の石が見つかったら空のlistを返してチェック終了
        return list = [];
      } else if (table[x][c].cellType == CellType.empty || table[x][c].cellType == CellType.canPut) {
        // チェックするセルが空だったら空のlistを返してチェック終了
        return list = [];
      } else {
        // 隣のセルが自分の石でも空でもない場合
        // [hit]している状態とし、ひっくり返せる候補としてセル座標をlistに追加
        hit = true;
        list.add(Coordinate(x: x, y: c));
      }
    }
  }
  return list = [];
}

/// 左側
List<Coordinate> checkLeft(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (y - 1 >= 0) {
    for (int c = y - 1; c >= 0; c--) {
      if (table[x][c].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[x][c].cellType == CellType.empty || table[x][c].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: x, y: c));
      }
    }
  }
  return list = [];
}

/// 下側
List<Coordinate> checkDown(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x + 1 < 8) {
    for (int r = x + 1; r < 8; r++) {
      if (table[r][y].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][y].cellType == CellType.empty || table[r][y].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: y));
      }
    }
  }
  return list = [];
}

/// 上側
List<Coordinate> checkUp(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x - 1 >= 0) {
    for (int r = x - 1; r >= 0; r--) {
      if (table[r][y].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][y].cellType == CellType.empty || table[r][y].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: y));
      }
    }
  }
  return list = [];
}

/// 左上
List<Coordinate> checkUpLeft(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x - 1 >= 0 && y - 1 >= 0) {
    int r = x - 1;
    int c = y - 1;
    while (r >= 0 && c >= 0) {
      if (table[r][c].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][c].cellType == CellType.empty || table[r][c].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: c));
      }
      r--;
      c--;
    }
  }
  return list = [];
}

/// 右上
List<Coordinate> checkUpRight(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x - 1 >= 0 && y + 1 < 8) {
    int r = x - 1;
    int c = y + 1;
    while (r >= 0 && c < 8) {
      if (table[r][c].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][c].cellType == CellType.empty || table[r][c].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: c));
      }
      r--;
      c++;
    }
  }
  return list = [];
}

/// 左下
List<Coordinate> checkDownLeft(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x + 1 < 8 && y - 1 >= 0) {
    int r = x + 1;
    int c = y - 1;
    while (r < 8 && c >= 0) {
      if (table[r][c].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][c].cellType == CellType.empty || table[r][c].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: c));
      }
      r++;
      c--;
    }
  }
  return list = [];
}

/// 右下
List<Coordinate> checkDownRight(int x, int y, Player nowPrayer) {
  List<Coordinate> list = [];
  bool hit = false;

  if (x + 1 < 8 && y + 1 < 8) {
    int r = x + 1;
    int c = y + 1;
    while (r < 8 && c < 8) {
      if (table[r][c].owner == nowPrayer) {
        if (hit) return list;
        return list = [];
      } else if (table[r][c].cellType == CellType.empty || table[r][c].cellType == CellType.canPut) {
        return list = [];
      } else {
        hit = true;
        list.add(Coordinate(x: r, y: c));
      }
      r++;
      c++;
    }
  }
  return list = [];
}
