import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../state/level_state.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        topMessageArea: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Util.loadImage('game/cross-flag'),
            const Text(
              'Level Selection',
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
            children: [
              Util.loadImage('game/user'),
              for (final level in gameLevelList)
                ListTile(
                  enabled: true,
                  onTap: () {
                    GoRouter.of(context).go('/play/session/${level.number}');
                  },
                  leading: Text(level.number.toString()),
                  title: Text(level.levelName),
                )
            ],
          ),
        ),
        rectangularMenuArea: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: Util.loadImage('back'),
        ),
      ),
    );
  }
}
