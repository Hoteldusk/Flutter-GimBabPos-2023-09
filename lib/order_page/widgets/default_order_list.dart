import 'package:flutter/material.dart';

class DefaultOrderList extends StatelessWidget {
  const DefaultOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "상품을 선택 해 주세요",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
