import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("OrderPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      id: "order",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
