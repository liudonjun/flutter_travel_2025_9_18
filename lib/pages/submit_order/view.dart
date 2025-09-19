import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SubmitOrderPage extends GetView<SubmitOrderController> {
  const SubmitOrderPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SubmitOrderPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmitOrderController>(
      init: SubmitOrderController(),
      id: "submit_order",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("submit_order")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
