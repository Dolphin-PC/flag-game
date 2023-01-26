import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/state/level_state.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/util/util.dart';
import 'package:provider/provider.dart';

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

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        topMessageArea: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Permanent Marker',
                fontSize: 55,
                height: 1,
              ),
            ),
          ],
        ),
        squarishMainArea: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Util.loadImage('game/2x/set-${flagObj['blue']}-${flagObj['white']}'),
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
                  onTap: () => onClickArrow('blue', 1),
                  child: Util.loadImage('game/2x/blue-up'),
                ),
                InkWell(
                  onTap: () => onClickArrow('white', 1),
                  child: Util.loadImage('game/2x/white-up'),
                ),
              ],
            ),
            Util.gap(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => onClickArrow('blue', -1),
                  child: Util.loadImage('game/2x/blue-down'),
                ),
                InkWell(
                  onTap: () => onClickArrow('white', -1),
                  child: Util.loadImage('game/2x/white-down'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onClickArrow(String flag, int direction) {
    int current = flagObj[flag] ?? 1;
    int next = current + direction;
    if (next == -1 || next == 3) return;

    setState(() => flagObj[flag] = next);
  }
}
