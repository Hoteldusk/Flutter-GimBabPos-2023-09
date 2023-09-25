import 'package:flutter/material.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey,
      child: const Row(
        children: [
          Expanded(
            child: Text(
              "품 목",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "단 가",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "수 량",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "금 액",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
