import 'package:flutter/material.dart';

class ProgressStatus extends StatefulWidget {
  const ProgressStatus({Key? key}) : super(key: key);

  @override
  State<ProgressStatus> createState() => _ProgressStatusState();
}

class _ProgressStatusState extends State<ProgressStatus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        )
      ],
    );
  }
}
