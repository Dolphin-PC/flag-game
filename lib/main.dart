import 'package:flutter/material.dart';
import 'package:game_template/src/page/game_screen.dart';
import 'package:game_template/src/page/level_selection_screen.dart';
import 'package:game_template/src/page/main_menu_screen.dart';
import 'package:game_template/src/provider/provider_game.dart';
import 'package:game_template/src/provider/provider_level.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderLevel()),
        ChangeNotifierProvider(create: (_) => ProviderGame()),
      ],
      child: MaterialApp(
        title: 'Flag Game',
        initialRoute: '/',
        routes: {
          '/': (context) => MainMenuScreen(),
          '/play': (context) => LevelSelectionScreen(),
          '/play/session': (context) => GameScreen(),
        },
        // home: MainMenuScreen(),
      ),
    );
  }
}
