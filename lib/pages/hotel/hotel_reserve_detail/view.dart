import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelReserveDetailPage extends GetView<HotelReserveDetailController> {
  const HotelReserveDetailPage({super.key});

  // 顶部App Bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFF7D9),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        "预订详情",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  // 房间信息卡片
  Widget _buildRoomInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Obx(() => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  controller.hotelImage.value,
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                      controller.hotelName.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(height: 4),
                Obx(() => Text(
                      controller.hotelSpecs.value,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  // 日期和政策信息
  Widget _buildDateAndPolicy() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 日期选择行
          Row(
            children: [
              Obx(() => Text(
                    controller.checkInDate.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(() => Text(
                      "${controller.nights.value}晚",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Obx(() => Text(
                    controller.checkOutDate.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              const Spacer(),
              GestureDetector(
                onTap: controller.onModifyTime,
                child: const Row(
                  children: [
                    Text(
                      "修改时间",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.blue, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 取消政策
          Row(
            children: [
              const Icon(Icons.check, color: Colors.green, size: 16),
              const SizedBox(width: 8),
              Obx(() => Text(
                    controller.cancelPolicy.value,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 16),

          // 入住时间信息
          Row(
            children: [
              Text(
                "入住时间:",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Obx(() => Text(
                    controller.checkInTime.value,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                  )),
              Text(
                " · 离店时间:",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Obx(() => Text(
                    controller.checkOutTime.value,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                  )),
              const Spacer(),
              GestureDetector(
                onTap: controller.onViewOrderDetails,
                child: Row(
                  children: [
                    Text(
                      "订房必读",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.sp,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.blue, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 入住信息
  Widget _buildGuestInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "入住信息",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // 房间数
          Row(
            children: [
              const Text(
                "房间数",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Obx(() => Text(
                    "${controller.roomCount.value}间",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              const SizedBox(width: 8),
              const Text(
                "(别墅默认最低1房间数)",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),

          SizedBox(height: 16.w),
          Divider(
            color: HexColor('#F0F0F0'),
          ),
          SizedBox(height: 16.w),

          // 入住人数
          Row(
            children: [
              const Text(
                "入住人",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Obx(() => Text(
                    "每单只需填写1人",
                    style: TextStyle(
                      fontSize: 16,
                      color: controller.guestCount.value == 1
                          ? Colors.grey
                          : Colors.black,
                    ),
                  )),
            ],
          ),
          SizedBox(height: 16.w),
          Divider(
            color: HexColor('#F0F0F0'),
          ),
          SizedBox(height: 16.w),

          // 联系电话
          Row(
            children: [
              const Text(
                "联系电话",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "+86",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down,
                  color: Colors.grey, size: 16),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "用于接收预订信息",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: controller.onPhoneChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 支付信息
  Widget _buildPaymentInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "支付信息",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // 促销优惠
          GestureDetector(
            onTap: controller.onPromotionDetails,
            child: Row(
              children: [
                const Text(
                  "促销优惠",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Obx(() => Text(
                      controller.promotionDiscount.value,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 发票
          GestureDetector(
            onTap: controller.onInvoiceDetails,
            child: const Row(
              children: [
                Text(
                  "发票",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                Text(
                  "提交订单后可在订单详情页开具",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 底部价格和支付按钮
  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    "共计:",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    "¥",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Obx(() => Text(
                        controller.finalPrice.value.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
              Container(
                width: 94.w,
                height: 30.w,
                decoration:
                    BoxDecoration(color: HexColor('#DC4A44').withOpacity(0.1)),
                child: Text(
                  "优惠¥10",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: HexColor('#EA605A'),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 300.w,
            child: ElevatedButton(
              onPressed: controller.onConfirmPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#FBDE44'),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: const Text(
                "确认支付",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFF7D9), // #FFF7D9
                  Color(0xFFFFFFFF), // #FFFFFF
                ],
                stops: [0.0, 1.0],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildRoomInfo(),
                  _buildDateAndPolicy(),
                  _buildGuestInfo(),
                  _buildPaymentInfo(),
                  const SizedBox(height: 100), // 为底部按钮留空间
                ],
              ),
            ),
          ),
        ),
        _buildBottomBar(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelReserveDetailController>(
      init: HotelReserveDetailController(),
      id: "hotel_reserve_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: _buildAppBar(),
          body: _buildView(),
        );
      },
    );
  }
}
