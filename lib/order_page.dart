import 'package:flutter/material.dart';
import 'package:gimbabpos/main_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, this.buttonStates, this.index});
  final buttonStates;
  final index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar()),
      body: TextButton(
        onPressed: () {
          buttonStates[index] = true;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                buttonStates: buttonStates,
              ),
            ),
          );
        },
        child: const Text("페이지 이동"),
      ),
    );
  }
}
