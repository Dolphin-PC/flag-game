import 'package:flutter/material.dart';

class Util {
  static Image loadImage(String img) {
    return Image(
      fit: BoxFit.cover,
      image: AssetImage('images/$img.png'),
    );
  }

  static SizedBox gap(double height) {
    return SizedBox(height: height);
  }
}
