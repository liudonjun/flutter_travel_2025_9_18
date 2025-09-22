import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightPredictPage extends GetView<FlightPredictController> {
  const FlightPredictPage({super.key});

  // 构建头部导航栏
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.getTheme(ThemeType.blue).primary,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // 导航栏
            Container(
              child: Row(
                children: [
                  // 返回按钮
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(24.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 40.w,
                      ),
                    ),
                  ),
                  // 标题
                  Expanded(
                    child: Center(
                      child: Text(
                        '杭州 — 北京',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // 收起按钮
                  Obx(() => GestureDetector(
                        onTap: controller.toggleCalendar,
                        child: Container(
                          padding: EdgeInsets.all(24.w),
                          child: Text(
                            controller.isCalendarExpanded.value ? '收起' : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            // 日历标题栏
            Obx(() => controller.isCalendarExpanded.value
                ? _buildCalendarHeader()
                : Container()),
          ],
        ),
      ),
    );
  }

  // 构建日历标题栏
  Widget _buildCalendarHeader() {
    return Container(
      height: 120.h,
      child: Column(
        children: [
          // 日历/价格走势 标签
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 2.h,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '日历',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: Text(
                      '价格走势',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // 星期标题
          Row(
            children: ['日', '一', '二', '三', '四', '五', '六'].map((day) {
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 构建日期选择器或日历
  Widget _buildDateSelectorOrCalendar() {
    return Container(
      color: ThemeColors.getTheme(ThemeType.blue).primary,
      child: controller.isCalendarExpanded.value
          ? _buildMonthlyCalendar()
          : _buildDateSelector(),
    );
  }

  // 构建日期选择器
  Widget _buildDateSelector() {
    final dates = [
      {'date': '01-26', 'day': '周日', 'price': '¥568'},
      {'date': '01-27', 'day': '周一', 'price': '¥645'},
      {'date': '01-28', 'day': '周二', 'price': '¥560'},
      {'date': '01-29', 'day': '周三', 'price': '¥549'},
      {'date': '01-30', 'day': '周四', 'price': '¥418'},
      {'date': '01-31', 'day': '周五', 'price': '¥620'},
    ];

    return Container(
      height: 180.w,
      child: Stack(
        children: [
          // 日期列表
          Obx(() => Row(
                children: dates.map((date) {
                  final isSelected =
                      controller.selectedDate.value == date['date'];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          controller.selectDate(date['date'] as String),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date['day'] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? ThemeColors.getTheme(ThemeType.blue)
                                        .primary
                                    : Colors.white,
                                fontSize: 24.sp,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              date['date'] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? ThemeColors.getTheme(ThemeType.blue)
                                        .primary
                                    : Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              date['price'] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? ThemeColors.getTheme(ThemeType.blue)
                                        .primary
                                    : Colors.white,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
          // 展开按钮
          Positioned(
            right: 0.w,
            top: 0.h,
            child: GestureDetector(
              onTap: controller.toggleCalendar,
              child: Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.w),
                decoration: BoxDecoration(
                  color: ThemeColors.getTheme(ThemeType.blue).primary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text('更多日历',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                        )),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 32.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建月历视图
  Widget _buildMonthlyCalendar() {
    return Container(
      child: Column(
        children: [
          // 月份标题
          Container(
            height: 80.h,
            child: Center(
              child: Text(
                controller.currentMonth.value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // 日历网格
          _buildCalendarGrid(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  // 构建日历网格
  Widget _buildCalendarGrid() {
    // 2022年2月的日历数据
    final calendarData = [
      // 第一周 (1月30日、31日和2月1-5日)
      [null, null, 1, 2, 3, 4, 5],
      // 第二周
      [6, 7, 8, 9, 10, 11, 12],
      // 第三周
      [13, 14, 15, 16, 17, 18, 19],
      // 第四周
      [20, 21, 22, 23, 24, 25, 26],
      // 第五周
      [27, 28, null, null, null, null, null],
    ];

    final prices = {
      6: '¥545',
      7: '¥545',
      8: '¥545',
      9: '¥545',
      10: '¥545',
      11: '¥545',
      12: '¥545',
      13: '¥545',
      14: '¥545',
      15: '¥545',
      16: '¥545',
      17: '¥545',
      18: '¥545',
      19: '¥545',
      20: '¥545',
      21: '¥545',
      22: '¥545',
      23: '¥545',
      24: '¥545',
      25: '¥545',
      26: '¥545',
      27: '¥545',
      28: '¥545',
    };

    return Column(
      children: calendarData.map((week) {
        return Container(
          height: 80.h,
          child: Row(
            children: week.map((day) {
              if (day == null) {
                return Expanded(child: Container());
              }

              final isSelected = day == 30; // 选中30号
              final price = prices[day] ?? '';

              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectCalendarDate(day),
                  child: Container(
                    margin: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.toString(),
                          style: TextStyle(
                            color: isSelected
                                ? ThemeColors.getTheme(ThemeType.blue).primary
                                : Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (price.isNotEmpty) ...[
                          SizedBox(height: 4.h),
                          Text(
                            price,
                            style: TextStyle(
                              color: isSelected
                                  ? ThemeColors.getTheme(ThemeType.blue).primary
                                  : Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  // 构建价格通知提示
  Widget _buildPriceNotification() {
    return Container(
      padding: EdgeInsets.all(24.w),
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
          Icon(
            Icons.trending_down,
            color: ThemeColors.getTheme(ThemeType.blue).primary,
            size: 40.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              '航线未来价格可能下降，建议等待购买',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28.sp,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textTertiary,
            size: 40.w,
          ),
        ],
      ),
    );
  }

  // 构建航班卡片
  Widget _buildFlightCard({
    required String airline,
    required String flightNumber,
    required String date,
    required String departureTime,
    required String arrivalTime,
    required String departureAirport,
    required String arrivalAirport,
    required String price,
    required String lowestDate,
    required String probability,
    required String predictedPrice,
    required bool isBookable,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // 航班信息头部
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 航空公司logo和航班号
              Container(
                margin: EdgeInsets.all(24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.asset(
                        AssetsImages.donghangPng,
                        fit: BoxFit.fitHeight,
                        width: 40.w,
                        height: 40.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      '$airline $flightNumber | $date',
                      style: TextStyle(
                        color: HexColor('#343434'),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // 购买按钮
              Container(
                width: 168.w,
                height: 48.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isBookable ? HexColor('#00B893') : HexColor('#406EFD'),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.w),
                    bottomLeft: Radius.circular(20.w),
                  ),
                ),
                child: Text(
                  isBookable ? '立即购买' : '等待购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          // 时间和地点
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                // 出发信息
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '杭州',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 26.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      departureTime,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      departureAirport,
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                // 飞机图标和线条
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(AssetsImages.feijiPng,
                          width: 60.w, height: 60.w),
                      SvgPicture.asset(
                        AssetsSvgs.guijiSvg,
                        width: 60.w,
                        height: 60.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.textTertiary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                // 到达信息
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '北京',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 26.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      arrivalTime,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      arrivalAirport,
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 32.w),
                // 价格
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          '¥',
                          style: TextStyle(
                            color: HexColor('#FF440A'),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: HexColor('#FF440A'),
                            fontSize: 48.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '当前最低价',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          // 预测信息
          Container(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 28.w, vertical: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '最低价日期',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        lowestDate,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '出现概率',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        probability,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '预测最低价',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        predictedPrice,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建底部筛选标签
  Widget _buildBottomTabs() {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: Obx(() => Row(
            children: [
              Expanded(
                child: _buildTabItem(
                  icon: Icons.sort,
                  label: '推荐排序',
                  isActive: controller.currentSortType.value == '推荐排序',
                ),
              ),
              Expanded(
                child: _buildTabItem(
                  icon: Icons.attach_money,
                  label: '价格排序',
                  isActive: controller.currentSortType.value == '价格排序',
                ),
              ),
              Expanded(
                child: _buildTabItem(
                  icon: Icons.access_time,
                  label: '时间排序',
                  isActive: controller.currentSortType.value == '时间排序',
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => controller.changeTab(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive
                ? ThemeColors.getTheme(ThemeType.blue).primary
                : AppColors.textTertiary,
            size: 40.w,
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              color: isActive
                  ? ThemeColors.getTheme(ThemeType.blue).primary
                  : AppColors.textTertiary,
              fontSize: 24.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildHeader(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Obx(() => _buildDateSelectorOrCalendar()),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 只在收起状态显示价格通知
                Obx(() => !controller.isCalendarExpanded.value
                    ? _buildPriceNotification()
                    : Container()),
                // 航班列表
                _buildFlightCard(
                  airline: '东航',
                  flightNumber: 'MU9105',
                  date: '01月20日 周日',
                  departureTime: '13:58',
                  arrivalTime: '16:26',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '418',
                  lowestDate: '01.17',
                  probability: '80%',
                  predictedPrice: '¥378',
                  isBookable: true,
                ),
                _buildFlightCard(
                  airline: '国航',
                  flightNumber: 'CA5988',
                  date: '01月20日 周日',
                  departureTime: '09:20',
                  arrivalTime: '11:45',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '378',
                  lowestDate: '01.17',
                  probability: '80%',
                  predictedPrice: '¥378',
                  isBookable: false,
                ),
                _buildFlightCard(
                  airline: '国航',
                  flightNumber: 'CA5988',
                  date: '01月20日 周日',
                  departureTime: '09:20',
                  arrivalTime: '11:45',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '378',
                  lowestDate: '',
                  probability: '',
                  predictedPrice: '',
                  isBookable: false,
                ),
                _buildFlightCard(
                  airline: '国航',
                  flightNumber: 'CA5988',
                  date: '01月20日 周日',
                  departureTime: '09:20',
                  arrivalTime: '11:45',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '378',
                  lowestDate: '',
                  probability: '',
                  predictedPrice: '',
                  isBookable: false,
                ),
                _buildFlightCard(
                  airline: '国航',
                  flightNumber: 'CA5988',
                  date: '01月20日 周日',
                  departureTime: '09:20',
                  arrivalTime: '11:45',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '378',
                  lowestDate: '',
                  probability: '',
                  predictedPrice: '',
                  isBookable: false,
                ),
                _buildFlightCard(
                  airline: '国航',
                  flightNumber: 'CA5988',
                  date: '01月20日 周日',
                  departureTime: '09:20',
                  arrivalTime: '11:45',
                  departureAirport: '萧山T3',
                  arrivalAirport: '首都T2',
                  price: '378',
                  lowestDate: '',
                  probability: '',
                  predictedPrice: '',
                  isBookable: false,
                ),
                SizedBox(height: 140.h), // 为底部标签栏留出空间
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightPredictController>(
      init: FlightPredictController(),
      id: "flight_predict",
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              _buildView(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomTabs(),
              ),
            ],
          ),
        );
      },
    );
  }
}
