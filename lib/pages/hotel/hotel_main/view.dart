import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/pages/hotel/hotel_home/index.dart';
import 'package:flutter_travel/pages/hotel/hotel_mine/index.dart';
import 'package:flutter_travel/pages/hotel/hotel_msg/index.dart';
import 'package:flutter_travel/pages/hotel/hotel_reserve/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelMainPage extends GetView<HotelMainController> {
  const HotelMainPage({super.key});

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.onTabChanged,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor('#1B1B1B'),
        unselectedItemColor: HexColor('#B1B1B1'),
        backgroundColor: Colors.white,
        selectedFontSize: 20.sp,
        unselectedFontSize: 20.sp,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AssetsImages.tabHotelHomePng,
                width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.tabHotelHomeActivePng,
                width: 48.w, height: 48.w),
            label: controller.tabTitles[0], // LocaleKeys.navTravel.tr
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsImages.tabHotelReservePng,
                width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.tabHotelReserveActivePng,
                width: 48.w, height: 48.w),
            label: controller.tabTitles[1],
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsImages.tabHotelMsgPng,
                width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.tabHotelMsgActivePng,
                width: 48.w, height: 48.w),
            label: controller.tabTitles[2],
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsImages.tabHotelMinePng,
                width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.tabHotelMineActivePng,
                width: 48.w, height: 48.w),
            label: controller.tabTitles[3],
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return _buildPageView();
  }

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      children: const [
        HotelHomePage(),
        HotelReservePage(),
        HotelMsgPage(),
        HotelMinePage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelMainController>(
      init: HotelMainController(),
      id: "hotel_main",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }
}
