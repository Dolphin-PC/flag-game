import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/page/include/game_screen_top.dart';
import 'package:game_template/src/state/level_state.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widget/common/screen_top.dart';

class GameScreen extends StatefulWidget {
  final LevelState level;

  const GameScreen(this.level, {super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Map<String, int> flagObj = {'blue': 1, 'white': 1};

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final image_prefix = '2x';

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        topMessageArea: Column(
          children: [
            ScreenTop(
              imageName: 'back',
              imageAction: () {
                GoRouter.of(context).go('/play');
              },
              title: '',
            ),
            GameScreenTop(),
          ],
        ),
        squarishMainArea: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Util.loadImage('game/$image_prefix/set-${flagObj['blue']}-${flagObj['white']}'),
            ],
          ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTapDown: (details) => onTapDownArrow('blue', 2),
                  onTapUp: (details) => onTapUpArrow('blue'),
                  child: Util.loadImage('game/$image_prefix/blue-up'),
                ),
                InkWell(
                  onTapDown: (details) => onTapDownArrow('white', 2),
                  onTapUp: (details) => onTapUpArrow('white'),
                  child: Util.loadImage('game/$image_prefix/white-up'),
                ),
              ],
            ),
            Util.gap(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTapDown: (details) => onTapDownArrow('blue', 0),
                  onTapUp: (details) => onTapUpArrow('blue'),
                  child: Util.loadImage('game/$image_prefix/blue-down'),
                ),
                InkWell(
                  onTapDown: (details) => onTapDownArrow('white', 0),
                  onTapUp: (details) => onTapUpArrow('white'),
                  child: Util.loadImage('game/$image_prefix/white-down'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /*deprecated*/
  void onClickArrow(String flag, int direction) {
    int current = flagObj[flag] ?? 1;
    int next = current + direction;
    if (next == -1 || next == 3) return;

    setState(() => flagObj[flag] = next);
  }

  void onTapDownArrow(String flag, int direction) {
    setState(() => flagObj[flag] = direction);
  }

  void onTapUpArrow(String flag) {
    setState(() => flagObj[flag] = 1);
  }
}
