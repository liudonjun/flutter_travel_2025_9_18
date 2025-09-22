import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightMsgPage extends GetView<FlightMsgController> {
  const FlightMsgPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FlightMsgPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightMsgController>(
      init: FlightMsgController(),
      id: "flight_msg",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("flight_msg")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
