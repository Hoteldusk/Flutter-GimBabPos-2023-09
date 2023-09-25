// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print
import 'package:flutter/material.dart';
import 'package:gimbabpos/order_page/order_page.dart';
import 'package:provider/provider.dart';

import 'provier.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<bool> buttonStates = List.generate(12, (index) => false);

  isUsedCheck(int index) {
    setState(() {
      buttonStates[index] = !buttonStates[index];
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<ProcductStore>().getProductList();
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
                    // 인덱스 포함해서 넘기기
                    isUsedCheck: () => isUsedCheck(index),
                    tableNumber: index + 1,
                  ),
                ),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: buttonStates[index] ? Colors.red : Colors.blue,
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
                    buttonStates[index] ? "사용중" : "사용가능",
                    style: const TextStyle(fontSize: 20),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
