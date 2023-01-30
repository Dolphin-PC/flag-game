import 'package:flutter/material.dart';

class OrderText extends StatefulWidget {
  const OrderText({Key? key}) : super(key: key);

  @override
  State<OrderText> createState() => _OrderTextState();
}

class _OrderTextState extends State<OrderText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('청기'),
        Text(' '),
        Text('올려'),
      ],
    );
  }
}
