import 'package:flutter/cupertino.dart';
import 'package:game_template/src/state/level.dart';
import 'package:game_template/src/state/order.dart';

class ProviderGame extends ChangeNotifier {
  int orderIndex = 0;
  List<Order> orderList = [];
  late Order currentOrder;

  bool isRunning = true;
  int life = 3;

  bool isCorrectEachOrder = false;

  initGame(Level level) {
    orderList = [];
    for (int i = 0; i < level.flagCount; i++) {
      orderList.add(Order.createNew());
    }

    currentOrder = orderList[orderIndex = 0];
  }

  nextOrder() {
    Future.delayed(Duration(seconds: 1), () {
      print('nextOrder');
      if (orderList.length > orderIndex) {
        currentOrder = orderList[orderIndex++];
        isCorrectEachOrder = false;
      } else {
        endGame();
      }
      notifyListeners();
    });
  }

  endGame() {
    print('game end');
    isRunning = false;
    notifyListeners();
  }

  compareOrder(Order userOrder) {
    if (userOrder.white == currentOrder.white && userOrder.blue == currentOrder.blue) {
      correctEachOrder();
      nextOrder();
    } else {
      // life - 1
      unCorrectEachOrder();
    }
  }

  correctEachOrder() {
    print('correctEachOrder');
    isCorrectEachOrder = true;
    notifyListeners();
  }

  unCorrectEachOrder() {
    print('unCorrectEachOrder');
    life -= 1;
    print(life);
    if (life == 0) {
      endGame();
    }
  }
}
