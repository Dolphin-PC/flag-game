import 'package:flutter/material.dart';
import 'package:game_template/src/widget/common/screen_top.dart';
import 'package:game_template/util/util.dart';
import 'package:go_router/go_router.dart';

import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final palette = context.watch<Palette>();

    return Scaffold(
      // backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        // topMessageArea: new GameScreenTop(),
        topMessageArea: ScreenTop(
          imageName: 'game/cross-flag',
          imageAction: () {},
          title: 'Flag Game!',
        ),
        squarishMainArea: Center(
          child: Util.loadImage('game/user'),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).go('/play');
                Navigator.pushNamed(context, '/play');
              },
              child: const Text('Play'),
            ),
            _gap,
            ElevatedButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: Util.loadImage('settings'),
            ),
            _gap,
          ],
        ),
      ),
    );
  }

  /// Prevents the game from showing game-services-related menu items
  /// until we're sure the player is signed in.
  ///
  /// This normally happens immediately after game start, so players will not
  /// see any flash. The exception is folks who decline to use Game Center
  /// or Google Play Game Services, or who haven't yet set it up.
  Widget _hideUntilReady({required Widget child, required Future<bool> ready}) {
    return FutureBuilder<bool>(
      future: ready,
      builder: (context, snapshot) {
        // Use Visibility here so that we have the space for the buttons
        // ready.
        return Visibility(
          visible: snapshot.data ?? false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: child,
        );
      },
    );
  }

  static const _gap = SizedBox(height: 10);
}
