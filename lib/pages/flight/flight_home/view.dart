import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightHomePage extends GetView<FlightHomeController> {
  const FlightHomePage({super.key});

  // 构建背景头部
  Widget _buildHeader() {
    return Container(
      height: 500.h,
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
      child: Stack(
        children: [
          // 背景花纹
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              AssetsImages.beijing1Png,
              width: 300.w,
              height: 300.h,
              fit: BoxFit.cover,
            ),
          ),
          // 标题
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '航班低价预测',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建搜索卡片（不使用transform）
  Widget _buildSearchCardWithoutTransform() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: [
            // 单程/往返切换
            _buildTripTypeSelector(),
            SizedBox(height: 32.h),
            // 城市选择
            _buildCitySelector(),
            SizedBox(height: 32.h),
            // 日期选择
            _buildDateSelector(),
            SizedBox(height: 40.h),
            // 搜索按钮
            _buildSearchButton(),
            SizedBox(height: 32.h),
            // 热门航线
            _buildPopularRoutes(),
          ],
        ),
      ),
    );
  }

  // 构建单程/往返切换
  Widget _buildTripTypeSelector() {
    return Obx(() => Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Row(
            children: [
              // 单程选项
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.isRoundTrip.value = false,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: !controller.isRoundTrip.value
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '单程',
                        style: TextStyle(
                          color: !controller.isRoundTrip.value
                              ? ThemeColors.getTheme(ThemeType.blue).primary
                              : AppColors.textTertiary,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // 往返选项
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.isRoundTrip.value = true,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: controller.isRoundTrip.value
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '往返',
                        style: TextStyle(
                          color: controller.isRoundTrip.value
                              ? ThemeColors.getTheme(ThemeType.blue).primary
                              : AppColors.textTertiary,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // 构建城市选择
  Widget _buildCitySelector() {
    return Obx(() => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              // 出发城市
              Expanded(
                child: GestureDetector(
                  onTap: controller.selectFromCity,
                  child: Text(
                    controller.fromCity.value,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // 交换按钮
              GestureDetector(
                onTap: controller.swapCities,
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AssetsSvgs.hangbanSvg,
                    width: 80.w,
                    height: 80.w,
                  ),
                ),
              ),
              // 到达城市
              Expanded(
                child: GestureDetector(
                  onTap: controller.selectToCity,
                  child: Text(
                    controller.toCity.value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // 构建日期选择
  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: controller.selectDate,
      child: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  controller.selectedDate.value,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  controller.selectedWeekday.value,
                  style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 32.sp,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // 构建搜索按钮
  Widget _buildSearchButton() {
    return GestureDetector(
      onTap: controller.predictTicket,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        padding: EdgeInsets.symmetric(vertical: 24.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeColors.getTheme(ThemeType.blue).primary,
              ThemeColors.getTheme(ThemeType.blue).primaryLight,
            ],
          ),
          borderRadius: BorderRadius.circular(56.r),
        ),
        child: Center(
          child: Text(
            '机票预测',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // 构建热门航线
  Widget _buildPopularRoutes() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Row(
            children: [
              Text(
                '北京-信阳 01-02',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 48.w),
              Text(
                '北京-武汉 01-04',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 48.w),
              Text(
                '北京-广州 01',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建特价机票列表
  Widget _buildSpecialOffers() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '特价机票',
                style: TextStyle(
                  color: HexColor('#1A1A1A'),
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      '筛选',
                      style: TextStyle(
                        color: ThemeColors.getTheme(ThemeType.blue).primary,
                        fontSize: 28.sp,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: ThemeColors.getTheme(ThemeType.blue).primary,
                      size: 32.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(() => GridView.builder(
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.w,
                  childAspectRatio: 172 / 80,
                ),
                itemCount: controller.popularRoutes.length,
                itemBuilder: (context, index) {
                  return _buildOfferItem(controller.popularRoutes[index]);
                },
              )),
        ],
      ),
    );
  }

  // 构建特价项
  Widget _buildOfferItem(Map<String, dynamic> route) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 路线
          Text(
            route['route'],
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.w),
          // 日期和价格
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (route['date'] != null)
                Text(
                  route['date'],
                  style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 20.sp,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¥${route['price']}',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (route['status'] != null && route['status'].isNotEmpty)
                    Text(
                      route['status'],
                      style: TextStyle(
                        color: HexColor(route['statusColor']),
                        fontSize: 16.sp,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              SizedBox(height: 200.h), // 为搜索卡片留出空间
              _buildSpecialOffers(),
              SizedBox(height: 100.h), // 底部安全区域
            ],
          ),
          // 搜索卡片悬浮在头部下方
          Positioned(
            top: 200.h, // 调整位置以重叠在头部上
            left: 32.w,
            right: 32.w,
            child: _buildSearchCardWithoutTransform(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightHomeController>(
      init: FlightHomeController(),
      id: "flight_home",
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: _buildView(),
        );
      },
    );
  }
}
