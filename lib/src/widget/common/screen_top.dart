import 'package:flutter/material.dart';
import 'package:game_template/util/util.dart';

class ScreenTop extends StatelessWidget {
  final String imageName;
  final String title;
  final Function imageAction;

  const ScreenTop({Key? key, required this.imageName, required this.title, required this.imageAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Util.loadImage(this.imageName),
          onTap: () => this.imageAction(),
        ),
        Text(
          this.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Permanent Marker',
            fontSize: 30,
            height: 1,
          ),
        ),
      ],
    );
  }
}
