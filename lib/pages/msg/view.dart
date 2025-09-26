import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/hotel/hotel_main/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MsgPage extends GetView<MsgController> {
  const MsgPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(
            HotelMainPage(),
          );
        },
        child: Text("MsgPage"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MsgController>(
      init: MsgController(),
      id: "msg",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
