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
        print(productList[i]['p_price']);
      }
      print("데이터 불러오기 성공");
    } catch (e) {
      print("getData 에러 발생 $e");
    }
    notifyListeners();
  }
}
