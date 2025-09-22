import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightFollowPage extends GetView<FlightFollowController> {
  const FlightFollowPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FlightFollowPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightFollowController>(
      init: FlightFollowController(),
      id: "flight_follow",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("flight_follow")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
