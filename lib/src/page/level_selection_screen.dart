import 'package:flutter/material.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/src/widget/common/screen_top.dart';
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
        topMessageArea: ScreenTop(
          imageName: 'back',
          imageAction: () {
            GoRouter.of(context).go('/');
          },
          title: 'level selection',
        ),
        squarishMainArea: Center(
          child: Util.loadImage('game/user'),
        ),
        rectangularMenuArea: Column(
          children: [
            for (final level in gameLevelList)
              ListTile(
                enabled: true,
                onTap: () {
                  GoRouter.of(context).go('/play/session/${level.number}');
                },
                leading: Text(level.number.toString()),
                title: Text(level.levelName),
              ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: Util.loadImage('back'),
            ),
          ],
        ),
      ),
    );
  }
}
