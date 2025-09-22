import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/i18n/index.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import '../travel/index.dart';
import '../order/index.dart';
import '../msg/index.dart';
import '../mine/index.dart';
import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.onTabChanged,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor('#2BC3A1'),
        unselectedItemColor: HexColor('#B1B1B1'),
        backgroundColor: Colors.white,
        selectedFontSize: 20.sp,
        unselectedFontSize: 20.sp,
        items: [
          BottomNavigationBarItem(
            icon:
                Image.asset(AssetsImages.chuxingPng, width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.chuxing1Png,
                width: 48.w, height: 48.w),
            label: LocaleKeys.navTravel.tr,
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset(AssetsImages.dingdanPng, width: 48.w, height: 48.w),
            activeIcon: Image.asset(AssetsImages.dingdan1Png,
                width: 48.w, height: 48.w),
            label: LocaleKeys.navOrder.tr,
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset(AssetsImages.xiaoxiPng, width: 48.w, height: 48.w),
            activeIcon:
                Image.asset(AssetsImages.xiaoxi1Png, width: 48.w, height: 48.w),
            label: LocaleKeys.navMessage.tr,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsImages.wodePng, width: 48.w, height: 48.w),
            activeIcon:
                Image.asset(AssetsImages.wode1Png, width: 48.w, height: 48.w),
            label: LocaleKeys.navMine.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      children: const [
        TravelPage(),
        OrderPage(),
        MsgPage(),
        MinePage(),
      ],
    );
  }

  Widget _buildView() {
    return _buildPageView();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }
}
