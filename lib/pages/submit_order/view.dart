import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SubmitOrderPage extends GetView<SubmitOrderController> {
  const SubmitOrderPage({super.key});

  // 构建背景图片
  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.beijingPng),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 构建倒计时部分
  Widget _buildCountdown() {
    return Container(
      width: 750.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor('#14B2B5').withOpacity(0.95),
            HexColor('#14B2B5').withOpacity(0.85),
            HexColor('#14B2B5').withOpacity(0.75),
            HexColor('#14B2B5').withOpacity(0.65),
            HexColor('#14B2B5').withOpacity(0.55),
            HexColor('#14B2B5').withOpacity(0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          Text(
            '制余支付时间',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 28.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(
            () => Text(
              '${controller.countdownMinutes.value}分${controller.countdownSeconds.value}秒',
              style: TextStyle(
                color: Colors.white,
                fontSize: 72.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建火车信息卡片
  Widget _buildTrainInfo() {
    return Obx(() => Container(
          margin: EdgeInsets.all(32.w),
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              // 日期和车次
              Row(
                children: [
                  Text(
                    controller.orderInfo['date'],
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 24.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    controller.orderInfo['date'],
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 时间和车站
              Row(
                children: [
                  // 出发信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.orderInfo['departureTime'],
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Text(
                              controller.orderInfo['departureStation'],
                              style: TextStyle(
                                color: HexColor('#333333'),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                  color: HexColor('#FFA500'),
                                  width: 1.w,
                                ),
                              ),
                              child: Text(
                                '始',
                                style: TextStyle(
                                  color: HexColor('#FFA500'),
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 中间车次信息
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: HexColor('#F5F5F5'),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          controller.orderInfo['trainNumber'],
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
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
                            color: HexColor('#666666'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        controller.orderInfo['duration'],
                        style: TextStyle(
                          color: HexColor('#666666'),
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),

                  // 到达信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          controller.orderInfo['arrivalTime'],
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                  color: HexColor('#14B2B5'),
                                  width: 1.w,
                                ),
                              ),
                              child: Text(
                                '终',
                                style: TextStyle(
                                  color: HexColor('#14B2B5'),
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              controller.orderInfo['arrivalStation'],
                              style: TextStyle(
                                color: HexColor('#333333'),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // 分隔线
              Container(
                height: 1.h,
                color: HexColor('#F5F5F5'),
              ),

              SizedBox(height: 32.h),

              // 发车时间
              Row(
                children: [
                  Text(
                    '发车时间：${controller.orderInfo['departureDate']}',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // 乘客信息
              Row(
                children: [
                  Text(
                    controller.orderInfo['passenger']['name'],
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: HexColor('#14B2B5'),
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      controller.orderInfo['passenger']['type'],
                      style: TextStyle(
                        color: HexColor('#14B2B5'),
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '¥${controller.orderInfo['passenger']['price']}',
                    style: TextStyle(
                      color: HexColor('#FF6B35'),
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // 证件信息
              Row(
                children: [
                  Text(
                    controller.orderInfo['passenger']['idType'],
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // 座位信息
              Row(
                children: [
                  Text(
                    '${controller.orderInfo['passenger']['seatType']} ${controller.orderInfo['passenger']['carNumber']} ${controller.orderInfo['passenger']['seatNumber']}',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // 查看制票规则
              GestureDetector(
                onTap: controller.onViewTicketRules,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '点击查看制票规则',
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: HexColor('#666666'),
                      size: 32.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // 构建底部支付区域
  Widget _buildPaymentSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(32.w),
      child: Column(
        children: [
          // 总金额
          Row(
            children: [
              Text(
                '总金额：',
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() => Text(
                    '¥${controller.totalAmount.value}',
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // TODO: Show payment details
                },
                child: Row(
                  children: [
                    Text(
                      '明细',
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 24.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: HexColor('#666666'),
                      size: 24.w,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 32.h),

          // 按钮区域
          Row(
            children: [
              // 取消订单按钮
              Expanded(
                child: SizedBox(
                  height: 88.h,
                  child: ElevatedButton(
                    onPressed: controller.onCancelOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#F5F5F5'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      '取消订单',
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 24.w),

              // 立即支付按钮
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 88.h,
                  child: ElevatedButton(
                    onPressed: controller.onPayNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#14B2B5'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      '立即支付',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Stack(
      children: [
        _buildBackgroundImage(),
        Column(
          children: [
            _buildCountdown(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTrainInfo(),
                    SizedBox(height: 120.h), // 为底部按钮留出空间
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmitOrderController>(
      init: SubmitOrderController(),
      id: "submit_order",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: HexColor('#14B2B5').withOpacity(0.95),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 40.w,
              ),
              onPressed: controller.onBack,
            ),
            title: Text(
              '未完成',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {
                  // TODO: Handle退改说明
                },
                child: Text(
                  '退改说明',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              _buildView(),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildPaymentSection(),
              ),
            ],
          ),
        );
      },
    );
  }
}
