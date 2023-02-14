import 'dart:math';

import 'package:game_template/src/enum/flag.dart';

class Order {
  final int time = 0;

  late final Flag blue;
  late final Flag white;

  Random random = Random();
  List<int> flagList = [0, 2];

  Order.createNew() {
    int flag = random.nextInt(2);
    int up_down = flagList[random.nextInt(flagList.length)];

    if (flag == 0) {
      this.blue = Flag.values[up_down];
      this.white = Flag.CENTER;
    } else if (flag == 1) {
      this.blue = Flag.CENTER;
      this.white = Flag.values[up_down];
    }
  }

  Order.createUser({required String flagName, required Flag flagDirection}) {
    if (flagName.toUpperCase() == 'BLUE') {
      this.blue = flagDirection;
      this.white = Flag.CENTER;
    } else if (flagName.toUpperCase() == 'WHITE') {
      this.blue = Flag.CENTER;
      this.white = flagDirection;
    }
  }

  Order({required this.blue, required this.white});
}
