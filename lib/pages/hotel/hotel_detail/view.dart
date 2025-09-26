import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/common/utils/hexColor.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelDetailPage extends GetView<HotelDetailController> {
  const HotelDetailPage({super.key});

  // 顶部轮播图片
  Widget _buildImageCarousel() {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: controller.hotelImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.hotelImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "封面",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "外观",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "房间",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 酒店信息
  Widget _buildHotelInfo() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.hotelInfo["name"],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "巴厘岛酒店排行 No.2",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.brown[600],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 16,
                color: Colors.brown[600],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                controller.hotelInfo["openYear"],
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Container(
                width: 1,
                height: 12,
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const Text(
                "免费客房WiFi",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Container(
                width: 1,
                height: 12,
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const Text(
                "洗衣服务",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      "亮点/设施",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              controller.hotelInfo["rating"].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.hotelInfo["reviewScore"],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${controller.hotelInfo["reviewCount"]}条点评",
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.hotelInfo["location"],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.hotelInfo["subway"],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "地图",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 日期选择
  Widget _buildDateSelection() {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    controller.checkInDate.value,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
          SizedBox(width: 16.w),
          // 中间的"1晚"标签
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              "1晚",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 16.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() => Text(
                    controller.checkOutDate.value,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),

          Spacer(),

          // 入住时间按钮
          GestureDetector(
            onTap: () {
              // 处理入住时间选择
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "入住时间",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.chevron_right,
                  size: 28.sp,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 房型筛选标签
  Widget _buildRoomTabs() {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.roomTabs.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.onTabChange(index),
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFFDD835) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    controller.roomTabs[index],
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: isSelected ? Colors.black87 : Colors.grey[600],
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  // 房型列表
  Widget _buildRoomList() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: controller.roomTypes.length,
        itemBuilder: (context, index) {
          final room = controller.roomTypes[index];
          return Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.w),
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.grey[200]!,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左侧图片
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    room["image"],
                    width: 160.w,
                    height: 160.w,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 24.w),

                // 右侧内容
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 房间名称
                      Text(
                        room["name"],
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 12.h),

                      // 房间信息
                      Text(
                        "${room["size"]} ${room["capacity"]} ${room["area"]}",
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.grey[600],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // 价格和预订按钮
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "¥",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: room["price"],
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "/起",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _showBookingBottomSheet(room),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDD835),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Text(
                                "预订",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 显示预订底部弹窗
  void _showBookingBottomSheet(Map<String, dynamic> room) {
    controller.onBookRoom(room);

    Get.bottomSheet(
      Container(
        height: 600,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // 头部
            Container(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "房间预订",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10.w,
                    right: 16.w,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 房间信息
                    Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#E4E4E4'), width: 1.w),
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              room["image"],
                              width: 80,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room["name"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "¥",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: room["price"],
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: "/起",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 登记入住
                    _buildDateSelector(
                      "登记入住:",
                      "请选择入住时间",
                      controller.bookingCheckInDate,
                      () => _selectCheckInDate(),
                    ),

                    const SizedBox(height: 16),

                    // 退房日期
                    _buildDateSelector(
                      "退房日期:",
                      "请选择退房日期",
                      controller.bookingCheckOutDate,
                      () => _selectCheckOutDate(),
                    ),

                    const SizedBox(height: 24),

                    // 房间数量和入住人数
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdownSelector(
                            "选择房间数",
                            controller.roomCountOptions,
                            controller.selectedRoomCount.value - 1,
                            (index) => controller.onRoomCountChange(index),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildDropdownSelector(
                            "选择入住人数",
                            controller.guestCountOptions,
                            controller.selectedGuestCount.value - 1,
                            (index) => controller.onGuestCountChange(index),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // 确认预订按钮
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onConfirmBooking();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#FBDE44'),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "确定预订",
                    style: TextStyle(
                      color: HexColor('#1B1B1B'),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 日期选择器组件
  Widget _buildDateSelector(String label, String placeholder,
      RxString dateValue, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: HexColor('#F6F6F6'),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Obx(() => Text(
                    dateValue.value.isEmpty ? placeholder : dateValue.value,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          dateValue.value.isEmpty ? Colors.grey : Colors.black,
                    ),
                  )),
            ),
            const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // 下拉选择器组件
  Widget _buildDropdownSelector(String placeholder, List<String> options,
      int selectedIndex, Function(int) onChanged) {
    return Container(
      height: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          isExpanded: true,
          value: selectedIndex,
          hint: Text(
            placeholder,
            style: const TextStyle(color: Colors.grey),
          ),
          items: options.asMap().entries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ),
      ),
    );
  }

  // 选择入住日期
  Future<void> _selectCheckInDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('zh', 'CN'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFFFDD835),
                  onPrimary: Colors.black87,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // 格式化日期为 "月日" 格式
      final formattedDate = "${picked.month}月${picked.day}日";
      controller.bookingCheckInDate.value = formattedDate;

      // 自动计算退房日期为第二天
      final checkOutDate = picked.add(const Duration(days: 1));
      final formattedCheckOutDate =
          "${checkOutDate.month}月${checkOutDate.day}日";
      controller.bookingCheckOutDate.value = formattedCheckOutDate;
    }
  }

  // 选择退房日期
  Future<void> _selectCheckOutDate() async {
    // 获取当前入住日期，如果没有选择则默认为今天
    DateTime initialCheckInDate = DateTime.now();
    if (controller.bookingCheckInDate.value.isNotEmpty) {
      // 解析入住日期并设置为最小可选日期的下一天
      final checkInDate =
          _parseSelectedDate(controller.bookingCheckInDate.value);
      initialCheckInDate = checkInDate?.add(const Duration(days: 1)) ??
          DateTime.now().add(const Duration(days: 1));
    }

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: initialCheckInDate,
      firstDate: initialCheckInDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('zh', 'CN'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFFFDD835),
                  onPrimary: Colors.black87,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // 格式化日期为 "月日" 格式
      final formattedDate = "${picked.month}月${picked.day}日";
      controller.bookingCheckOutDate.value = formattedDate;
    }
  }

  // 解析日期字符串（例如 "2月18日" -> DateTime）
  DateTime? _parseSelectedDate(String dateString) {
    if (dateString.isEmpty) return null;

    try {
      // 简化解析，假设是当前年份
      final regex = RegExp(r'(\d+)月(\d+)日');
      final match = regex.firstMatch(dateString);

      if (match != null) {
        final month = int.parse(match.group(1)!);
        final day = int.parse(match.group(2)!);
        final currentYear = DateTime.now().year;

        return DateTime(currentYear, month, day);
      }
    } catch (e) {
      // 解析失败，返回null
    }

    return null;
  }

  Widget _buildServiceButton() {
    return Positioned(
      bottom: 150.w,
      right: 30.w,
      child: Container(
        width: 104.w,
        height: 120.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            ClipOval(
              child: Image.network(
                'https://ygking.cn/logo.jpg',
                width: 104.w,
                height: 104.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 80.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "客服",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageCarousel(),
                    _buildHotelInfo(),
                    _buildDateSelection(),
                    const SizedBox(height: 8),
                    _buildRoomTabs(),
                    const SizedBox(height: 8),
                    _buildRoomList(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
        _buildServiceButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelDetailController>(
      init: HotelDetailController(),
      id: "hotel_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: _buildView(),
        );
      },
    );
  }
}
