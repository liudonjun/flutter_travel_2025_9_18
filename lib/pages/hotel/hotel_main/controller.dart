import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelMainController extends GetxController {
  HotelMainController();

  _initData() {
    update(["hotel_main"]);
  }

  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  final List<String> tabTitles = ['首页', '预定', '消息', '我的'];

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
