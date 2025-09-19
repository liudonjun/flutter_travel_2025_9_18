import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SelectTimePage extends GetView<SelectTimeController> {
  const SelectTimePage({super.key});

  // 构建顶部导航栏
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#14B2B5'),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 40.sp,
        ),
        onPressed: controller.onBack,
      ),
      title: Text(
        '选择出发日期',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  // 构建月份选择器
  Widget _buildMonthSelector() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.w),
        topRight: Radius.circular(20.w),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: controller.onPreviousMonth,
              child: Container(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  '上个月',
                  style: TextStyle(
                    color: HexColor('#14B2B5'),
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ),
            Obx(() => Text(
                  '${controller.currentYear.value}年${controller.currentMonth.value}月',
                  style: TextStyle(
                    color: HexColor('#333333'),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            GestureDetector(
              onTap: controller.onNextMonth,
              child: Container(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  '下个月',
                  style: TextStyle(
                    color: HexColor('#14B2B5'),
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建星期标题
  Widget _buildWeekHeader() {
    const weekDays = ['日', '一', '二', '三', '四', '五', '六'];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: weekDays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color: HexColor('#999999'),
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 构建日期格子
  Widget _buildDateCell(Map<String, dynamic> dayData) {
    final day = dayData['day'] as int;
    final isCurrentMonth = dayData['isCurrentMonth'] as bool;
    final isToday = dayData['isToday'] as bool;
    final isSelected = dayData['isSelected'] as bool;

    Color textColor = HexColor('#333333');
    Color bgColor = Colors.transparent;
    String specialText = '';

    if (!isCurrentMonth) {
      textColor = HexColor('#CCCCCC');
    } else if (isSelected) {
      bgColor = HexColor('#14B2B5');
      textColor = Colors.white;
      specialText = '出发';
    } else if (isToday) {
      specialText = '今天';
    } else {
      specialText = controller.getLunarOrSpecial(day);
    }

    return GestureDetector(
      onTap: isCurrentMonth ? () => controller.onDateSelected(day) : null,
      child: Container(
        height: 120.h,
        margin: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 32.sp,
                fontWeight:
                    isSelected || isToday ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            if (specialText.isNotEmpty) ...[
              SizedBox(height: 4.h),
              Text(
                specialText,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : isToday
                          ? HexColor('#14B2B5')
                          : HexColor('#999999'),
                  fontSize: 20.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // 构建日历网格
  Widget _buildCalendarGrid() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: GetBuilder<SelectTimeController>(
        id: "select_time",
        builder: (_) {
          final calendarDays = controller.generateCalendarDays();
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: calendarDays.length,
            itemBuilder: (context, index) {
              return _buildDateCell(calendarDays[index]);
            },
          );
        },
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            HexColor('#F5F5F5'),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          _buildMonthSelector(),
          _buildWeekHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: _buildCalendarGrid(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectTimeController>(
      init: SelectTimeController(),
      id: "select_time",
      builder: (_) {
        return Scaffold(
          backgroundColor: HexColor('#14B2B5'),
          appBar: _buildAppBar(),
          body: _buildView(),
        );
      },
    );
  }
}
