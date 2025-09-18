import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MinePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
