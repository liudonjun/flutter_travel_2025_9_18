import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelReservePage extends GetView<HotelReserveController> {
  const HotelReservePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HotelReservePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelReserveController>(
      init: HotelReserveController(),
      id: "hotel_reserve",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("hotel_reserve")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
