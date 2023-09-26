// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gimbabpos/provier.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final DateTime _focusedDay = DateTime.now();
  final DateTime _firstDay = DateTime(2023, 1, 1);
  final DateTime _lastDay = DateTime(2023, 12, 31);
  DateTime? selectedDay;
  var orderList = [];
  String formattedDate = "";

  selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }
    return date.year == selectedDay!.year &&
        date.month == selectedDay!.month &&
        date.day == selectedDay!.day;
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<OrderStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("주문 정보 확인"),
        actions: [
          IconButton(
            onPressed: () {
              // print(_focusedDay);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
              print("selectedDay : $selectedDay   focusedDay : $focusedDay");
              formattedDate = DateFormat('yyyy-MM-dd').format(selectedDay);
              print("formattedDate : $formattedDate");
              // 버튼하나 추가해서 해야될듯
              orderList = store.getOrderList(formattedDate);
            },
            selectedDayPredicate: (DateTime date) {
              if (selectedDay == null) {
                return false;
              }
              return date.year == selectedDay!.year &&
                  date.month == selectedDay!.month &&
                  date.day == selectedDay!.day;
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return Text(orderList[index]['date']);
            },
          ),
        ],
      ),
    );
  }
}
