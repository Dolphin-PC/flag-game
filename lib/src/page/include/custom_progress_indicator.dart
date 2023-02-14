import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_game.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void switched(bool determinate) {
    print('determinate');

    if (determinate) {
      animationController.stop();
    } else {
      animationController..forward(from: animationController.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    ProviderGame _providerGame = Provider.of<ProviderGame>(context, listen: true);

    if (_providerGame.isCorrectEachOrder) {
      animationController.forward(from: 0);
    }

    print(animationController.value);

    return LinearProgressIndicator(
      color: Colors.green,
      minHeight: 30,
      value: animationController.value,
      semanticsLabel: 'Linear progress indicator',
    );
  }
}
