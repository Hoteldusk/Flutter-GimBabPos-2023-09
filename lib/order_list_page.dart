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
    final watchStore = context.watch<OrderStore>();

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
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(selectedDay);
              store.getOrderList(formattedDate);
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
            itemCount: watchStore.orderList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (c) {
                      return const Dialog(
                        child: SizedBox(
                          height: 400,
                          width: 300,
                          child: Column(
                              // children: [
                              //   Text("$tableNumber 번 테이블"),
                              //   OrderTitle(),
                              //   SizedBox(
                              //     height: 200,
                              //     width: double.infinity,
                              //     child: OrderList(orderList: orderList),
                              //   ),
                              //   TotalPrice(getTotalPrice: getTotalPrice),
                              // ],
                              ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // 테두리 색상
                      width: 1.0, // 테두리 두께
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        watchStore.orderList[index]['time'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "${watchStore.orderList[index]['table_number']} 번 테이블",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        watchStore.orderList[index]['total_price'].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
