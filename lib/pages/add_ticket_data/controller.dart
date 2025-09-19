import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTicketDataController extends GetxController {
  AddTicketDataController();

  final RxMap<String, dynamic> trainInfo = <String, dynamic>{
    'trainNumber': 'G1251',
    'departureTime': '08:50',
    'arrivalTime': '10:30',
    'departureStation': '大连北',
    'arrivalStation': '北京',
    'duration': '1小时40分',
    'date': '02月13日 周一',
  }.obs;

  final RxList<Map<String, dynamic>> passengers = <Map<String, dynamic>>[
    {
      'name': '牛魔王',
      'idCard': '222402198610173253',
      'phone': '13304917210',
      'type': '成人票',
      'isExpanded': false,
    },
    {
      'name': '红孩儿',
      'idCard': '222402198610173253',
      'phone': '13304917210',
      'type': '儿童票',
      'isExpanded': false,
    }
  ].obs;

  final RxList<List<Map<String, dynamic>>> seatMap =
      <List<Map<String, dynamic>>>[
    [
      {'type': 'window', 'text': '靠窗'},
      {'type': 'seat', 'number': 'A', 'selected': false},
      {'type': 'seat', 'number': 'B', 'selected': true},
      {'type': 'seat', 'number': 'C', 'selected': false},
      {'type': 'aisle', 'text': '过道'},
      {'type': 'seat', 'number': 'D', 'selected': false},
      {'type': 'seat', 'number': 'F', 'selected': false},
      {'type': 'window', 'text': '靠窗'},
    ],
    [
      {'type': 'window', 'text': '靠窗'},
      {'type': 'seat', 'number': 'A', 'selected': false},
      {'type': 'seat', 'number': 'B', 'selected': false},
      {'type': 'seat', 'number': 'C', 'selected': false},
      {'type': 'aisle', 'text': '过道'},
      {'type': 'seat', 'number': 'D', 'selected': false},
      {'type': 'seat', 'number': 'F', 'selected': false},
      {'type': 'window', 'text': '靠窗'},
    ],
  ].obs;

  final RxString selectedSeats = '已选1/可选2'.obs;

  _initData() {
    update(["add_ticket_data"]);
  }

  void onBack() {
    Get.back();
  }

  void togglePassenger(int index) {
    passengers[index]['isExpanded'] = !passengers[index]['isExpanded'];
    passengers.refresh();
  }

  void deletePassenger(int index) {
    passengers.removeAt(index);
  }

  void addPassenger() {
    // TODO: Navigate to add passenger page
    Get.snackbar('添加乘车人', '跳转到添加乘车人页面');
  }

  void onSeatTap(int row, int col) {
    if (seatMap[row][col]['type'] == 'seat') {
      // 先取消该行所有座位的选中状态
      for (int i = 0; i < seatMap[row].length; i++) {
        if (seatMap[row][i]['type'] == 'seat') {
          seatMap[row][i]['selected'] = false;
        }
      }

      // 然后选中当前点击的座位
      seatMap[row][col]['selected'] = true;
      seatMap.refresh();

      // Update selected seats count
      int selectedCount = 0;
      for (var rowData in seatMap) {
        for (var seat in rowData) {
          if (seat['type'] == 'seat' && seat['selected'] == true) {
            selectedCount++;
          }
        }
      }
      selectedSeats.value = '已选$selectedCount/可选2';
    }
  }

  void submitOrder() {
    Get.snackbar('提交订单', '订单提交成功');
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
