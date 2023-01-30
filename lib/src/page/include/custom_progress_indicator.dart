import 'package:flutter/material.dart';

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
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void switched(bool determinate) {
    if (determinate) {
      animationController.stop();
    } else {
      animationController
        ..forward(from: animationController.value)
        ..repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: Colors.green,
      minHeight: 30,
      value: animationController.value,
      semanticsLabel: 'Linear progress indicator',
    );
  }
}
