import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  OrderController();

  // Tab控制器
  late TabController tabController;

  // 选中的Tab索引
  final RxInt selectedTabIndex = 0.obs;

  // Tab标签
  final List<String> tabs = ['全部', '待支付', '待出行', '已完成'];

  // 订单数据
  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[
    {
      'id': 'G1827',
      'route': '大连 → 上海',
      'departureTime': '2月28日 20:30',
      'seats': ['02车02B号', '02车03C号'],
      'price': 1680,
      'status': 'unpaid', // unpaid, pending, completed
      'statusText': '待支付',
      'canModify': true,
      'canRefund': true,
      'type': 'train',
    },
    {
      'id': 'G1827',
      'route': '上海 → 深圳',
      'departureTime': '2月28日 20:30',
      'seats': ['02车02B号', '02车03C号'],
      'price': 980,
      'status': 'pending',
      'statusText': '待出行',
      'canModify': true,
      'canRefund': true,
      'type': 'flight',
    },
    {
      'id': 'G1827',
      'route': '成都 → 乌鲁木齐',
      'departureTime': '2月28日 20:30',
      'departure': '成都天府2号航站楼出发',
      'price': 0,
      'status': 'completed',
      'statusText': '已出票',
      'canModify': false,
      'canRefund': true,
      'type': 'flight',
    },
    {
      'id': 'G1827',
      'route': '大连 → 上海',
      'departureTime': '2月28日 20:30',
      'seats': ['02车02B号', '02车03C号'],
      'price': 0,
      'status': 'completed',
      'statusText': '已出票',
      'canModify': false,
      'canRefund': true,
      'type': 'train',
    },
    {
      'id': 'G1827',
      'route': '成都 → 乌鲁木齐',
      'departureTime': '2月28日 20:30',
      'price': 0,
      'status': 'completed',
      'statusText': '已出票',
      'canModify': false,
      'canRefund': true,
      'type': 'flight',
    },
  ].obs;

  // 过滤后的订单
  RxList<Map<String, dynamic>> get filteredOrders {
    if (selectedTabIndex.value == 0) {
      return orders; // 全部
    } else if (selectedTabIndex.value == 1) {
      return orders.where((order) => order['status'] == 'unpaid').toList().obs;
    } else if (selectedTabIndex.value == 2) {
      return orders.where((order) => order['status'] == 'pending').toList().obs;
    } else {
      return orders
          .where((order) => order['status'] == 'completed')
          .toList()
          .obs;
    }
  }

  _initData() {
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    update(["order"]);
  }

  // 返回上一页
  void onBack() {
    Get.back();
  }

  // 退改说明
  void onRefundPolicy() {
    Get.snackbar('退改说明', '查看退改说明');
  }

  // Tab切换
  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    tabController.animateTo(index);
  }

  // 可改签
  void onModifyOrder(Map<String, dynamic> order) {
    Get.snackbar('改签', '改签订单 ${order['id']}');
  }

  // 可退票
  void onRefundOrder(Map<String, dynamic> order) {
    Get.snackbar('退票', '退票订单 ${order['id']}');
  }

  // 删除订单
  void onDeleteOrder(Map<String, dynamic> order) {
    Get.dialog(
      AlertDialog(
        title: const Text('删除订单'),
        content: const Text('确定要删除这个订单吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              orders.remove(order);
              Get.back();
              Get.snackbar('成功', '订单已删除');
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
