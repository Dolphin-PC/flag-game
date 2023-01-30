import 'package:flutter/material.dart';

class StatusCircle extends StatefulWidget {
  final circleColor;

  const StatusCircle({Key? key, this.circleColor}) : super(key: key);

  @override
  State<StatusCircle> createState() => _StatusCircleState();
}

class _StatusCircleState extends State<StatusCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: widget.circleColor, shape: BoxShape.circle),
    );
  }
}
