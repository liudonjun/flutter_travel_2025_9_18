import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelMsgPage extends GetView<HotelMsgController> {
  const HotelMsgPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HotelMsgPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelMsgController>(
      init: HotelMsgController(),
      id: "hotel_msg",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("hotel_msg")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
