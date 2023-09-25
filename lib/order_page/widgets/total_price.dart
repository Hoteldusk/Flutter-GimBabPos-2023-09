// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    this.getTotalPrice,
  });
  final getTotalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blueGrey,
      child: Row(
        children: [
          const Expanded(
              child: Text(
            "합 계",
            textAlign: TextAlign.center,
          )),
          const Expanded(child: Text(" ")),
          const Expanded(child: Text(" ")),
          Expanded(
              child: Text(
            getTotalPrice().toString(),
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
