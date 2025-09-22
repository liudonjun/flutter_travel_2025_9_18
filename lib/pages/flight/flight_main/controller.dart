import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightMainController extends GetxController {
  FlightMainController();

  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  final List<String> tabTitles = ['数据', '追踪', '消息', '我的'];

  _initData() {
    update(["flight_main"]);
  }

  void onTabChanged(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
