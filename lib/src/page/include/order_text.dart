import 'package:flutter/material.dart';
import 'package:game_template/src/enum/flag.dart';
import 'package:game_template/src/state/order.dart';

class OrderText extends StatefulWidget {
  final Order order;
  const OrderText({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderText> createState() => _OrderTextState();
}

class _OrderTextState extends State<OrderText> {
  var flagObj = {
    Flag.UP: '올려',
    Flag.DOWN: '내려',
  };

  Text renderText() {
    String text = '';
    if (widget.order.blue == Flag.CENTER) {
      text = '백기 : ${flagObj[widget.order.white]}';
    } else if (widget.order.white == Flag.CENTER) {
      text = '청기 : ${flagObj[widget.order.blue]}';
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        renderText(),
      ],
    );
  }
}
