// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print
import 'package:flutter/material.dart';
import 'package:gimbabpos/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    this.buttonStates,
  });
  final buttonStates;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  void isUsedCheck(int index) {
    widget.buttonStates[index] = !widget.buttonStates[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('우리김밥 POS'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 4x4 그리드
          mainAxisSpacing: 20.0, // 수직 방향의 간격
          crossAxisSpacing: 20.0, // 수평 방향의 간격
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {
              debugPrint('Button ${index + 1} pressed.');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(
                    buttonStates: widget.buttonStates,
                    index: index,
                  ),
                ),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor:
                  widget.buttonStates[index] ? Colors.red : Colors.blue,
            ),

            // child: Text('Button ${index + 1}'),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${index + 1}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.buttonStates[index] ? "사용중" : "사용가능",
                    style: const TextStyle(fontSize: 20),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
