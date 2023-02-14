import 'package:flutter/material.dart';
import 'package:game_template/src/page/include/custom_progress_indicator.dart';
import 'package:game_template/src/page/include/order_text.dart';
import 'package:game_template/src/page/include/status_circle.dart';
import 'package:game_template/src/provider/provider_game.dart';
import 'package:game_template/src/provider/provider_level.dart';
import 'package:game_template/util/util.dart';
import 'package:provider/provider.dart';

class GameScreenTop extends StatefulWidget {
  const GameScreenTop({Key? key}) : super(key: key);

  @override
  State<GameScreenTop> createState() => _GameScreenTopState();
}

class _GameScreenTopState extends State<GameScreenTop> {
  @override
  Widget build(BuildContext context) {
    ProviderLevel _providerLevel = Provider.of<ProviderLevel>(context, listen: false);
    ProviderGame _providerGame = Provider.of<ProviderGame>(context, listen: false);

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomProgressIndicator()),
            StatusCircle(circleColor: Colors.green),
            StatusCircle(circleColor: Colors.orange),
            StatusCircle(circleColor: Colors.white),
          ],
        ),
        Util.gap(12.0),
        Container(
          // height: 100.0,
          width: double.maxFinite,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderText(
                order: _providerGame.currentOrder,
              )
            ],
          ),
        )
      ],
    );
  }
}
