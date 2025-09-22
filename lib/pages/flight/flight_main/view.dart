import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import '../flight_home/index.dart';
import '../flight_follow/index.dart';
import '../flight_msg/index.dart';
import '../flight_mine/index.dart';
import 'index.dart';

class FlightMainPage extends GetView<FlightMainController> {
  const FlightMainPage({super.key});

  Widget _buildBottomNavigationBar() {
    // 使用蓝色主题
    final theme = ThemeColors.getTheme(ThemeType.blue);

    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.onTabChanged,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.primary,
          unselectedItemColor: AppColors.textDisabled,
          backgroundColor: Colors.white,
          selectedFontSize: 20.sp,
          unselectedFontSize: 20.sp,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AssetsImages.flightShujiaPng,
                  width: 48.w, height: 48.w),
              activeIcon: Image.asset(AssetsImages.flightShujia1Png,
                  width: 48.w, height: 48.w),
              label: '数据',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AssetsImages.flightZhuizhongPng,
                  width: 48.w, height: 48.w),
              activeIcon: Image.asset(AssetsImages.flightZhuizhong1Png,
                  width: 48.w, height: 48.w),
              label: '追踪',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AssetsImages.flightXiaoxiPng,
                  width: 48.w, height: 48.w),
              activeIcon: Image.asset(AssetsImages.flightXiaoxi1Png,
                  width: 48.w, height: 48.w),
              label: '消息',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AssetsImages.flightWodePng,
                  width: 48.w, height: 48.w),
              activeIcon: Image.asset(AssetsImages.flightWode1Png,
                  width: 48.w, height: 48.w),
              label: '我的',
            ),
          ],
        ));
  }

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      children: const [
        FlightHomePage(),
        FlightFollowPage(),
        FlightMsgPage(),
        FlightMinePage(),
      ],
    );
  }

  Widget _buildView() {
    return _buildPageView();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightMainController>(
      init: FlightMainController(),
      id: "flight_main",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }
}
