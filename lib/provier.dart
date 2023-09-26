// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class ProcductStore extends ChangeNotifier {
  var productList = [];

  getProductList() async {
    try {
      var result = await _firestore.collection('tbl_product').get();
      for (var i = 0; i < result.docs.length; i++) {
        var data = result.docs[i].data();
        print("data : $data");
        productList.add(data);
      }
      print("데이터 불러오기 성공");
    } catch (e) {
      print("getData 에러 발생 $e");
    }
    notifyListeners();
  }
}

class OrderStore extends ChangeNotifier {
  var orderList = [];

  insertOrderList(dataList, tableNumber, date, time, totalPrice) async {
    try {
      await _firestore.collection('tbl_orders').add({
        'date': date,
        'time': time,
        'products': dataList,
        'table_number': tableNumber,
        'total_price': totalPrice,
      });
    } catch (e) {
      print("insertOrderList 에러 발생 $e");
    }
  }

  getOrderList(date) async {
    var result = await _firestore
        .collection('tbl_orders')
        .where('date', isEqualTo: date)
        .get();

    orderList.clear();
    for (var i = 0; i < result.docs.length; i++) {
      var data = result.docs[i].data();
      orderList.add(data);
    }
    notifyListeners();
  }
}
