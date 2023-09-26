// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gimbabpos/provier.dart';
import 'package:provider/provider.dart';

class OrderProductList extends StatefulWidget {
  const OrderProductList({
    super.key,
    this.orderListadd,
  });
  final orderListadd;
  @override
  State<OrderProductList> createState() => _OrderProductListState();
}

class _OrderProductListState extends State<OrderProductList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
        // primary: false, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
        itemCount: context.watch<ProcductStore>().productList.length,
        itemBuilder: (context, index) {
          var product = context.watch<ProcductStore>().productList[index];
          return GestureDetector(
            onTap: () {
              widget.orderListadd(product);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product['p_name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      product['p_rem'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    product['p_price'].toString(),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
