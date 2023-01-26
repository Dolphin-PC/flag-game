import 'package:flutter/material.dart';
import 'package:game_template/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        topMessageArea: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Util.loadImage('game/cross-flag'),
            const Text(
              'Flag Game!',
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
            children: [Util.loadImage('game/user')],
          ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/play');
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
