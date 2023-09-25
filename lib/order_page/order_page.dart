// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:gimbabpos/order_page/widgets/default_order_list.dart';
import 'package:gimbabpos/order_page/widgets/order_list.dart';
import 'package:gimbabpos/order_page/widgets/order_product_list.dart';
import 'package:gimbabpos/order_page/widgets/payment_button.dart';
import 'package:gimbabpos/order_page/widgets/total_price.dart';
import 'widgets/order_title.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
    this.isUsedCheck,
    this.tableNumber,
  });

  final isUsedCheck;
  final tableNumber;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var orderList = [];

  orderListadd(dynamic orderObject) {
    String targetName = orderObject['p_name'];
    bool found = false;

    setState(() {
      for (var item in orderList) {
        if (item['p_name'] == targetName) {
          item['count']++;
          found = true;
          break;
        }
      }

      if (!found) {
        // name이 "abc"인 항목을 찾지 못했으면 새로운 맵을 추가
        orderList.add({
          "p_name": targetName,
          "p_price": orderObject['p_price'],
          "count": 1,
        });
        print(orderList[0]);
      }
    });
  }

  getTotalPrice() {
    num totalprice = 0;

    for (var i = 0; i < orderList.length; i++) {
      var localNum = orderList[i]['p_price'] * orderList[i]['count'];
      totalprice += localNum;
    }

    return totalprice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text("${widget.tableNumber}번 테이블"),
      )),
      body: Column(
        children: [
          // 타이틀
          const OrderTitle(),

          // 주문 리스트
          Container(
            color: Colors.grey,
            height: 200,
            child: orderList.isEmpty
                ? const DefaultOrderList()
                : OrderList(orderList: orderList),
          ),

          // 합계
          TotalPrice(getTotalPrice: getTotalPrice),

          // 주문 선택 리스트
          OrderProductList(orderListadd: orderListadd),

          // 결제 버튼
          PaymentButton(
            isUsedCheck: widget.isUsedCheck,
            tableNumber: widget.tableNumber,
            orderList: orderList,
            getTotalPrice: getTotalPrice,
          )
        ],
      ),
    );
  }
}






// TextButton(
//         onPressed: () {
//           isUsedCheck();
//           Navigator.pop(context);
//         },
//         child: const Text("페이지 이동"),
//       ),
