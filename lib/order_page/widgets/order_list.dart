// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    this.orderList,
  });
  final orderList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
                child: Text(
              orderList[index]['p_name'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            )),
            Expanded(
                child: Text(
              orderList[index]['p_price'].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            )),
            Expanded(
                child: Text(
              orderList[index]['count'].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            )),
            Expanded(
                child: Text(
              (orderList[index]['count'] * orderList[index]['p_price'])
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            )),
          ],
        );
      },
    );
  }
}
