import 'package:flutter/material.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/src/widget/common/screen_top.dart';
import 'package:game_template/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/provider_game.dart';
import '../provider/provider_level.dart';
import '../state/level.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderLevel _providerLevel = Provider.of<ProviderLevel>(context, listen: false);
    ProviderGame _providerGame = Provider.of<ProviderGame>(context, listen: false);

    void startGame(Level level) {
      _providerLevel.setLevelState(level);
      _providerGame.initGame(level);
      Navigator.pushNamed(context, '/play/session');
    }

    return Scaffold(
      // backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        topMessageArea: ScreenTop(
          imageName: 'back',
          imageAction: () {
            Navigator.pushNamed(context, '/');
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
                onTap: () => startGame(level),
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
