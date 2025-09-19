import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SelectTicketPage extends GetView<SelectTicketController> {
  const SelectTicketPage({super.key});

  // 构建顶部导航栏
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: HexColor('#333333'),
          size: 40.sp,
        ),
        onPressed: controller.onBack,
      ),
      title: Obx(() => Text(
            '${controller.departureCity.value} — ${controller.arrivalCity.value}',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
      centerTitle: true,
    );
  }

  // 构建日期选择器
  Widget _buildDateSelector() {
    return Container(
      height: 132.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // 日期列表
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: controller.dates.length,
              itemBuilder: (context, index) {
                final date = controller.dates[index];
                return Obx(() => GestureDetector(
                      onTap: () => controller.onDateSelected(index),
                      child: Container(
                        width: 100.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedDateIndex.value == index
                              ? HexColor('#14B2B5')
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date['date']!,
                              style: TextStyle(
                                color:
                                    controller.selectedDateIndex.value == index
                                        ? Colors.white
                                        : HexColor('#333333'),
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              date['day']!,
                              style: TextStyle(
                                color:
                                    controller.selectedDateIndex.value == index
                                        ? Colors.white
                                        : HexColor('#999999'),
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          // 日历图标
          GestureDetector(
            onTap: controller.onCalendarTap,
            child: Container(
              width: 132.w,
              height: 132.w,
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: HexColor('#F5F5F5'),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 阴影颜色
                    offset: const Offset(-4, 0), // 阴影往左（负数 = 左侧）
                    blurRadius: 50, // 模糊半径
                    spreadRadius: 0.5, // 扩散范围
                  ),
                ],
              ),
              child: SvgPicture.asset(
                AssetsSvgs.riliSvg,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建车票项
  Widget _buildTicketItem(Map<String, dynamic> ticket) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // 车次信息和时间
          Row(
            children: [
              // 左侧时间信息
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket['date'],
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      ticket['departureTime'],
                      style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          ticket['departureStation'],
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 24.sp,
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
              // 中间车次和时长
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      ticket['trainNumber'],
                      style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 28.sp,
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
                          color: HexColor('#666666'),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      ticket['duration'],
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // 右侧到达信息
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ticket['date'],
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      ticket['arrivalTime'],
                      style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
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
                          ticket['arrivalStation'],
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32.w),
          Divider(
            height: .5.w,
            color: HexColor('#F6F6F6'),
          ),
          SizedBox(height: 20.w),
          // 座位类型信息
          Row(
            children: [
              // 商务座
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '商务：',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ticket['businessClass']['count'],
                      style: TextStyle(
                        color: ticket['businessClass']['available']
                            ? HexColor('#333333')
                            : HexColor('#CCCCCC'),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // 一等座
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '一等：',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ticket['firstClass']['count'],
                      style: TextStyle(
                        color: ticket['firstClass']['available']
                            ? HexColor('#333333')
                            : HexColor('#CCCCCC'),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // 二等座
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '二等：',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ticket['secondClass']['count'],
                      style: TextStyle(
                        color: ticket['secondClass']['available']
                            ? HexColor('#333333')
                            : HexColor('#CCCCCC'),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建空状态显示
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsImages.zhanwuchechiPng,
            width: 200.w,
            height: 200.w,
          ),
          SizedBox(height: 40.h),
          Text(
            '暂无满足条件的车次',
            style: TextStyle(
              color: HexColor('#999999'),
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: controller.resetTickets,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: HexColor('#14B2B5'),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                '重新搜索',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建车票列表
  Widget _buildTicketList() {
    return Expanded(
      child: Obx(() {
        // 如果没有车票数据，显示空状态
        if (controller.tickets.isEmpty) {
          return _buildEmptyState();
        }

        // 有车票数据时显示列表
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          itemCount: controller.tickets.length,
          itemBuilder: (context, index) {
            final ticket = controller.tickets[index];
            return GestureDetector(
              onTap: () => controller.onTicketTap(ticket),
              child: _buildTicketItem(ticket),
            );
          },
        );
      }),
    );
  }

  // 构建底部操作栏
  Widget _buildBottomBar() {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        child: Container(
          height: 120.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            children: [
              // 筛选按钮
              Expanded(
                child: GestureDetector(
                  onTap: controller.onFilterTap,
                  child: Container(
                    height: 80.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsSvgs.saixuanSvg,
                          width: 50.w,
                          height: 50.w,
                          colorFilter: ColorFilter.mode(
                            HexColor('#666666'),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '筛选',
                          style: TextStyle(
                            color: HexColor('#666666'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              // 筛选按钮
              Expanded(
                child: GestureDetector(
                  onTap: controller.onFilterTap,
                  child: Container(
                    height: 80.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsSvgs.haoshiSvg,
                          width: 50.w,
                          height: 50.w,
                          colorFilter: ColorFilter.mode(
                            HexColor('#666666'),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '耗时',
                          style: TextStyle(
                            color: HexColor('#666666'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              // 筛选按钮
              Expanded(
                child: GestureDetector(
                  onTap: controller.onFilterTap,
                  child: Container(
                    height: 80.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsSvgs.facheSvg,
                          width: 50.w,
                          height: 50.w,
                          colorFilter: ColorFilter.mode(
                            HexColor('#666666'),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '发车',
                          style: TextStyle(
                            color: HexColor('#666666'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildDateSelector(),
        _buildTicketList(),
        _buildBottomBar(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectTicketController>(
      init: SelectTicketController(),
      id: "select_ticket",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildView(),
        );
      },
    );
  }
}
