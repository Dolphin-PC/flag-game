import 'package:flutter/foundation.dart';
import 'package:game_template/src/state/level.dart';

class ProviderLevel extends ChangeNotifier {
  late Level level;

  void setLevelState(Level level) {
    this.level = level;
  }
}
