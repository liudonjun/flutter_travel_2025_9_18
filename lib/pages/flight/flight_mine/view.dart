import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightMinePage extends GetView<FlightMineController> {
  const FlightMinePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FlightMinePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightMineController>(
      init: FlightMineController(),
      id: "flight_mine",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("flight_mine")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
