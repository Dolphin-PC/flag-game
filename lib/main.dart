import 'package:flutter/material.dart';
import 'package:game_template/src/page/game_screen.dart';
import 'package:game_template/src/page/level_selection_screen.dart';
import 'package:game_template/src/page/main_menu_screen.dart';
import 'package:game_template/src/state/level_state.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'src/style/my_transition.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainMenuScreen(key: Key('main menu')), routes: [
        GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
                  child: const LevelSelectionScreen(key: Key('level selection')),
                  color: context.watch<Palette>().backgroundLevelSelection,
                ),
            routes: [
              GoRoute(
                path: 'session/:level',
                pageBuilder: (context, state) {
                  final levelNumber = int.parse(state.params['level']!);
                  final level = gameLevelList.singleWhere((e) => e.number == levelNumber);
                  return buildMyTransition<void>(
                    child: GameScreen(
                      level,
                      key: const Key('play session'),
                    ),
                    color: context.watch<Palette>().backgroundPlaySession,
                  );
                },
              )
            ])
      ]),
    ],
  );
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Palette(),
        )
      ],
      child: Builder(
        builder: (context) {
          final palette = context.watch<Palette>();

          return MaterialApp.router(
            title: 'Flag Game',
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: palette.darkPen,
                background: palette.backgroundMain,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: palette.ink,
                ),
              ),
            ),
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
          );
        },
      ),
    );
  }
}
