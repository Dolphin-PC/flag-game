import 'package:flutter/material.dart';
import 'package:game_template/src/page/include/game_screen_top.dart';
import 'package:game_template/src/provider/provider_game.dart';
import 'package:game_template/src/state/order.dart';
import 'package:game_template/src/style/responsive_screen.dart';
import 'package:game_template/util/util.dart';
import 'package:provider/provider.dart';

import '../enum/flag.dart';
import '../provider/provider_level.dart';
import '../widget/common/screen_top.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final image_prefix = '2x';
  Map<String, Flag> flagObj = {'blue': Flag.CENTER, 'white': Flag.CENTER};

  late ProviderLevel _providerLevel;
  late ProviderGame _providerGame;

  Image showFlag() {
    return Util.loadImage('game/$image_prefix/set-${flagObj['blue']!.index}-${flagObj['white']!.index}');
  }

  @override
  Widget build(BuildContext context) {
    _providerLevel = Provider.of<ProviderLevel>(context, listen: false);
    _providerGame = Provider.of<ProviderGame>(context, listen: false);

    return Scaffold(
      body: ResponsiveScreen(
        topMessageArea: Column(
          children: [
            ScreenTop(
              imageName: 'back',
              imageAction: () {
                Navigator.pop(context);
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
              showFlag(),
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
                  onTapDown: (details) => onTapDownArrow('blue', Flag.UP),
                  onTapUp: (details) => onTapUpArrow('blue'),
                  child: Util.loadImage('game/$image_prefix/blue-up'),
                ),
                InkWell(
                  onTapDown: (details) => onTapDownArrow('white', Flag.UP),
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
                  onTapDown: (details) => onTapDownArrow('blue', Flag.DOWN),
                  onTapUp: (details) => onTapUpArrow('blue'),
                  child: Util.loadImage('game/$image_prefix/blue-down'),
                ),
                InkWell(
                  onTapDown: (details) => onTapDownArrow('white', Flag.DOWN),
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

  void onTapDownArrow(String flag, Flag direction) {
    setState(() {
      flagObj[flag] = direction;
      _providerGame.compareOrder(Order.createUser(flagName: flag, flagDirection: direction));
    });
  }

  void onTapUpArrow(String flag) {
    setState(() => flagObj[flag] = Flag.CENTER);
  }
}
