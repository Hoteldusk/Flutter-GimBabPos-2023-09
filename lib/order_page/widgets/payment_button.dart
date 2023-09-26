// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gimbabpos/order_page/widgets/order_list.dart';
import 'package:gimbabpos/order_page/widgets/order_title.dart';
import 'package:gimbabpos/order_page/widgets/total_price.dart';
import 'package:gimbabpos/provier.dart';
import 'package:provider/provider.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    this.orderList,
    this.isUsedCheck,
    this.getTotalPrice,
    this.tableNumber,
  });
  final orderList;
  final isUsedCheck;
  final getTotalPrice;
  final tableNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: ElevatedButton(
        onPressed: () {
          // 리스트가 비어있을경우 상품선택 팝업
          if (orderList.isEmpty) {
            showDialog(
              context: context,
              builder: (c) {
                return const Dialog(
                  child: SizedBox(
                    height: 400,
                    width: 300,
                    child: Center(
                      child: Text(
                        "상품을 선택해주세요",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            );
            // 리스트가 차있을경우 결제 팝업
          } else {
            showDialog(
              context: context,
              builder: (c) {
                return Dialog(
                  child: SizedBox(
                    height: 400,
                    width: 300,
                    child: Column(
                      children: [
                        Text("$tableNumber 번 테이블"),
                        const OrderTitle(),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: OrderList(orderList: orderList),
                        ),
                        TotalPrice(getTotalPrice: getTotalPrice),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<OrderStore>().insertOrderList(
                                        orderList,
                                        tableNumber,
                                        20230926,
                                        getTotalPrice());
                                    isUsedCheck();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "카드 결제",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<OrderStore>().insertOrderList(
                                        orderList,
                                        tableNumber,
                                        20230926,
                                        getTotalPrice());
                                    isUsedCheck();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "현금 결제",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }, //button logic end
        child: const Text("결 제"),
        // Navigator.pop(context);
      ),
    );
  }
}
