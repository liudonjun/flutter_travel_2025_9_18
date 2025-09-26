import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelMinePage extends GetView<HotelMineController> {
  const HotelMinePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HotelMinePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelMineController>(
      init: HotelMineController(),
      id: "hotel_mine",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("hotel_mine")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
