import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'index.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  const OrderDetailPage({super.key});

  // 构建头部背景
  Widget _buildHeader() {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // 导航栏
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 48.w,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '订单详情',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 48.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.w),
            // 订单号
            Row(
              children: [
                SizedBox(width: 32.w),
                Text(
                  '订单号：E567823456',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 构建行程信息卡片
  Widget _buildTripCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      transform: Matrix4.translationValues(0, -50.h, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            // 日期信息
            Row(
              children: [
                Text(
                  '02月13日 周一',
                  style: TextStyle(
                    color: AppColors.textQuaternary,
                    fontSize: 28.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  '02月13日 周一',
                  style: TextStyle(
                    color: AppColors.textQuaternary,
                    fontSize: 28.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // 时间和车次信息
            Row(
              children: [
                // 出发时间
                Text(
                  '08:50',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                // 车次信息
                Column(
                  children: [
                    Text(
                      'G1251',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 200.w,
                      height: 45.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsImages.kuanPng),
                        ),
                      ),
                      child: Text(
                        '经停信息',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '1小时40分',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // 到达时间
                Text(
                  '10:30',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            // 城市信息
            Row(
              children: [
                // 出发城市
                Row(
                  children: [
                    Text(
                      '大连北',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: AppColors.orange,
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        '始',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // 到达城市
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        '终',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '北京',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            // 出发时间详细信息
            Row(
              children: [
                Text(
                  '发车时间：',
                  style: TextStyle(
                    color: AppColors.textQuaternary,
                    fontSize: 24.sp,
                  ),
                ),
                Text(
                  '2023年02月13日 周一',
                  style: TextStyle(
                    color: AppColors.textQuaternary,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '车票当日当次有效',
                  style: TextStyle(
                    color: AppColors.textQuaternary,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            // 操作按钮
            Row(
              children: [
                _buildActionButton('变更到站', AppColors.accent),
                _buildDivider(),
                _buildActionButton('在线座位', AppColors.accent),
                _buildDivider(),
                _buildActionButton('改签', AppColors.accent),
                _buildDivider(),
                _buildActionButton('退票', AppColors.accent),
              ],
            ),

            SizedBox(
              height: 40.w,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '牛魔王',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        '成人票',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '¥680',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  '中国居民身份证',
                  style: TextStyle(
                    color: HexColor('#666666'),
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  '一等座 02车 02B号',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.w),
            Column(
              children: [
                // 二维码
                QrImageView(
                  data: 'E567823456',
                  version: QrVersions.auto,
                  size: 400.w,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 32.h),
                // 底部信息
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '点击查看剩余 1 人',
                        style: TextStyle(
                          color: AppColors.textQuaternary,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textTertiary,
                        size: 32.w,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 构建分割线
  Widget _buildDivider() {
    return Container(
      width: 1.w,
      height: 32.h,
      color: AppColors.divider,
    );
  }

  // 构建操作按钮
  Widget _buildActionButton(String text, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          // border: Border.all(color: color, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 24.sp,
            ),
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildTripCard(),
          SizedBox(height: 100.h), // 底部安全区域
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      init: OrderDetailController(),
      id: "order_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: _buildView(),
        );
      },
    );
  }
}
