import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightSelectCityPage extends GetView<FlightSelectCityController> {
  const FlightSelectCityPage({super.key});

  // 构建顶部搜索栏
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ThemeColors.getTheme(ThemeType.blue).primary,
            ThemeColors.getTheme(ThemeType.blue).primaryLight,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 标题栏
              Container(
                height: 80.w,
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        '取消',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '选择城市',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 确定选择
                        Get.back();
                      },
                      child: Text(
                        '确定',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 搜索框
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
                    // 出发地输入框
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: TextField(
                          controller: controller.fromCityController,
                          onChanged: controller.searchCities,
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            hintText: '出发地(城市名/机场名)',
                            hintStyle: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.textTertiary,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    // 目的地输入框
                    Expanded(
                      child: Container(
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.toCityController,
                                onChanged: controller.searchCities,
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  color: AppColors.textPrimary,
                                ),
                                decoration: InputDecoration(
                                  hintText: '杭州',
                                  hintStyle: TextStyle(
                                    fontSize: 28.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 24.h,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: controller.clearSearch,
                              child: Container(
                                padding: EdgeInsets.all(16.w),
                                child: Icon(
                                  Icons.close,
                                  size: 32.w,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建标签栏
  Widget _buildTabBar() {
    return Container(
      height: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // 航线标签
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ThemeColors.getTheme(ThemeType.blue).primary,
                    width: 4.h,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  '航线',
                  style: TextStyle(
                    color: ThemeColors.getTheme(ThemeType.blue).primary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // 国际/中国港澳台标签
          Expanded(
            child: Center(
              child: Text(
                '国际/中国港澳台',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 32.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建当前/附近城市
  Widget _buildNearbySection() {
    return Container(
      padding: EdgeInsets.all(32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetsSvgs.weizhiSvg,
                width: 32.w,
                height: 32.w,
                colorFilter: ColorFilter.mode(
                  ThemeColors.getTheme(ThemeType.blue).primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '当前/附近',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.refreshLocation,
                child: Row(
                  children: [
                    Icon(
                      Icons.refresh,
                      size: 28.w,
                      color: ThemeColors.getTheme(ThemeType.blue).primary,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '重新定位',
                      style: TextStyle(
                        color: ThemeColors.getTheme(ThemeType.blue).primary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 76.w / 36.w,
                ),
                itemCount: controller.nearbyCities.length,
                itemBuilder: (context, index) {
                  final city = controller.nearbyCities[index];
                  return GestureDetector(
                    onTap: () => controller.selectCity(city),
                    child: Container(
                      width: 150.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F5F6FA'),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (index == 0) ...[
                              SvgPicture.asset(
                                AssetsSvgs.weizhiSvg,
                                width: 32.w,
                                height: 32.w,
                                colorFilter: ColorFilter.mode(
                                  ThemeColors.getTheme(ThemeType.blue).primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ],
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  city['name'],
                                  style: TextStyle(
                                    color: HexColor('#343434'),
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (city['distance'] != null) ...[
                                  SizedBox(height: 4.h),
                                  Text(
                                    city['distance'],
                                    style: TextStyle(
                                      color: AppColors.textTertiary,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  // 构建历史城市
  Widget _buildHistorySection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: ThemeColors.getTheme(ThemeType.blue).primary,
                  borderRadius: BorderRadius.circular(3.w),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                '历史城市',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // 清空历史
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 28.w,
                      color: AppColors.textTertiary,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '清空',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 150.w / 72.h,
                ),
                itemCount: controller.historyCities.length,
                itemBuilder: (context, index) {
                  final city = controller.historyCities[index];
                  return GestureDetector(
                    onTap: () => controller.selectCity(city),
                    child: Container(
                      width: 150.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F5F6FA'),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          city['name'],
                          style: TextStyle(
                            color: HexColor('#343434'),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  // 构建热门城市
  Widget _buildHotCitiesSection() {
    return Container(
      padding: EdgeInsets.all(32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: ThemeColors.getTheme(ThemeType.blue).primary,
                  borderRadius: BorderRadius.circular(3.w),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                '热门城市',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 32.h,
                  childAspectRatio: 150.w / 72.h,
                ),
                itemCount: controller.hotCities.length,
                itemBuilder: (context, index) {
                  final city = controller.hotCities[index];
                  return GestureDetector(
                    onTap: () => controller.selectCity(city),
                    child: Container(
                      width: 150.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F5F6FA'),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          city['name'],
                          style: TextStyle(
                            color: HexColor('#343434'),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  // 构建字母索引城市
  Widget _buildAlphabetSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 32.h,
                  childAspectRatio: 150.w / 72.h,
                ),
                itemCount: controller.alphabetCities['A']?.length ?? 0,
                itemBuilder: (context, index) {
                  final city = controller.alphabetCities['A']![index];
                  return GestureDetector(
                    onTap: () => controller.selectCity(city),
                    child: Container(
                      width: 150.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F5F6FA'),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          city['name'],
                          style: TextStyle(
                            color: HexColor('#343434'),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  // 构建右侧字母索引
  Widget _buildAlphabetIndex() {
    const alphabets = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'J',
      'K',
      'L',
      'M',
      'N',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'W',
      'X',
      'Y',
      'Z'
    ];

    return Positioned(
      right: 5.w,
      top: 0,
      bottom: 0,
      child: Container(
        width: 48.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: alphabets.map((letter) {
            return GestureDetector(
              onTap: () {
                // 跳转到对应字母部分
              },
              child: Container(
                width: 48.w,
                height: 32.h,
                child: Center(
                  child: Text(
                    letter,
                    style: TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildHeader(),
        _buildTabBar(),
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _buildNearbySection(),
                    Container(
                      height: 1.h,
                      color: AppColors.divider,
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                    ),
                    SizedBox(height: 32.h),
                    _buildHistorySection(),
                    SizedBox(height: 32.h),
                    Container(
                      height: 1.h,
                      color: AppColors.divider,
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                    ),
                    _buildHotCitiesSection(),
                    Container(
                      height: 1.h,
                      color: AppColors.divider,
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                    ),
                    _buildAlphabetSection(),
                  ],
                ),
              ),
              _buildAlphabetIndex(),
            ],
          ),
        ),
        // 确定按钮
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(32.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 88.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.getTheme(ThemeType.blue).primary,
                    ThemeColors.getTheme(ThemeType.blue).primaryLight,
                  ],
                ),
                borderRadius: BorderRadius.circular(44.r),
              ),
              child: Center(
                child: Text(
                  '确定',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightSelectCityController>(
      init: FlightSelectCityController(),
      id: "flight_select_city",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _buildView(),
        );
      },
    );
  }
}
