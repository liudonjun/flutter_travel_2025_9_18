import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/common/routers/index.dart';
import 'package:get/get.dart';

class SelectTicketController extends GetxController {
  SelectTicketController();

  // 路线信息
  final RxString departureCity = '大连'.obs;
  final RxString arrivalCity = '北京'.obs;

  // 当前选择的日期索引
  final RxInt selectedDateIndex = 2.obs; // 默认选择第3个（02-12）

  // 筛选条件
  final RxString selectedTrainType = '特快'.obs; // 高铁、特快
  final RxString selectedDepartureTime = '00:00-08:00'.obs; // 出发时间段
  final RxString selectedDepartureStation = '大连北'.obs; // 出发车站
  final RxString selectedArrivalStation = '北京朝阳'.obs; // 到达车站
  final RxString selectedSeatType = '商务座'.obs; // 座位类型

  // 筛选选项数据
  final List<String> trainTypes = ['高铁', '特快'];
  final List<String> departureTimes = [
    '00:00-08:00',
    '08:00-12:00',
    '12:00-18:00',
    '18:00-24:00'
  ];
  final List<String> departureStations = ['大连北', '大连'];
  final List<String> arrivalStations = ['北京朝阳', '北京南站', '北京西站'];
  final List<String> seatTypes = ['商务座', '一等座', '二等座', '软卧', '硬卧', '硬座'];

  // 日期列表
  final List<Map<String, String>> dates = [
    {'date': '02-10', 'day': '周五'},
    {'date': '02-11', 'day': '周六'},
    {'date': '02-12', 'day': '周日'},
    {'date': '02-13', 'day': '周一'},
    {'date': '02-14', 'day': '周二'},
  ];

  // 车票数据
  final RxList<Map<String, dynamic>> tickets = <Map<String, dynamic>>[
    {
      'trainNumber': 'G1251',
      'departureTime': '08:50',
      'arrivalTime': '10:30',
      'departureStation': '大连北',
      'arrivalStation': '北京',
      'duration': '1小时40分',
      'date': '02月13日 周一',
      'businessClass': {'available': true, 'count': '183张'},
      'firstClass': {'available': true, 'count': '有'},
      'secondClass': {'available': true, 'count': '有'},
    },
    {
      'trainNumber': 'G1255',
      'departureTime': '09:10',
      'arrivalTime': '11:50',
      'departureStation': '大连北',
      'arrivalStation': '北京',
      'duration': '1小时40分',
      'date': '02月13日 周一',
      'businessClass': {'available': false, 'count': '无'},
      'firstClass': {'available': true, 'count': '9张'},
      'secondClass': {'available': true, 'count': '有'},
    },
    {
      'trainNumber': 'G1255',
      'departureTime': '10:30',
      'arrivalTime': '14:05',
      'departureStation': '大连',
      'arrivalStation': '北京南站',
      'duration': '1小时40分',
      'date': '02月13日 周一',
      'businessClass': {'available': true, 'count': '183张'},
      'firstClass': {'available': true, 'count': '有'},
      'secondClass': {'available': true, 'count': '有'},
    },
  ].obs;

  _initData() {
    update(["select_ticket"]);
  }

  // 选择日期
  void onDateSelected(int index) {
    selectedDateIndex.value = index;
  }

  // 返回上一页
  void onBack() {
    Get.back();
  }

  // 点击日历图标
  void onCalendarTap() {
    Get.toNamed(RouteNames.selectTime);
  }

  // 点击车票
  void onTicketTap(Map<String, dynamic> ticket) {
    Get.toNamed(RouteNames.ticketDetail);
  }

  // 筛选按钮
  void onFilterTap() {
    Get.bottomSheet(
      _buildFilterBottomSheet(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  // 构建筛选底部弹窗
  Widget _buildFilterBottomSheet() {
    return Container(
      height: Get.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Column(
        children: [
          // 拖拽指示器
          Container(
            width: 80.w,
            height: 8.h,
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            decoration: BoxDecoration(
              color: HexColor('#E8E8E8'),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          // 顶部标题栏
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    '取消',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 32.sp,
                    ),
                  ),
                ),
                Text(
                  '筛选',
                  style: TextStyle(
                    color: HexColor('#333333'),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: onFilterConfirm,
                  child: Text(
                    '确定',
                    style: TextStyle(
                      color: HexColor('#14B2B5'),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 筛选内容
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.w),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 车型选择
                      _buildFilterSection(
                        '车型选择',
                        trainTypes,
                        selectedTrainType.value,
                        onTrainTypeSelected,
                      ),
                      SizedBox(height: 40.h),

                      // 出发时间
                      _buildFilterSection(
                        '出发时间',
                        departureTimes,
                        selectedDepartureTime.value,
                        onDepartureTimeSelected,
                      ),
                      SizedBox(height: 40.h),

                      // 出发车站
                      _buildFilterSection(
                        '出发车站',
                        departureStations,
                        selectedDepartureStation.value,
                        onDepartureStationSelected,
                      ),
                      SizedBox(height: 40.h),

                      // 到达车站
                      _buildFilterSection(
                        '到达车站',
                        arrivalStations,
                        selectedArrivalStation.value,
                        onArrivalStationSelected,
                      ),
                      SizedBox(height: 40.h),

                      // 只看有票
                      _buildFilterSection(
                        '只看有票',
                        seatTypes,
                        selectedSeatType.value,
                        onSeatTypeSelected,
                      ),
                      SizedBox(height: 40.h),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  // 构建筛选选项组
  Widget _buildFilterSection(String title, List<String> options,
      String selectedValue, Function(String) onSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: HexColor('#333333'),
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20.h),
        Wrap(
          spacing: 16.w,
          runSpacing: 16.h,
          children: options.map((option) {
            final isSelected = selectedValue == option;
            return GestureDetector(
              onTap: () => onSelected(option),
              child: Container(
                width: 204.w,
                height: 84.w,
                decoration: BoxDecoration(
                  color: isSelected ? HexColor('#14B2B5') : HexColor('#F2F5F5'),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Center(
                  child: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.white : HexColor('#999999'),
                      fontSize: 28.sp,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 筛选确定
  void onFilterConfirm() {
    Get.back();
    // 应用筛选条件 - 模拟筛选后没有结果
    tickets.clear(); // 清空列表来模拟没有车次的情况
    Get.snackbar('筛选', '已应用筛选条件');
  }

  // 重置车票数据（用于测试）
  void resetTickets() {
    tickets.assignAll([
      {
        'trainNumber': 'G1251',
        'departureTime': '08:50',
        'arrivalTime': '10:30',
        'departureStation': '大连北',
        'arrivalStation': '北京',
        'duration': '1小时40分',
        'date': '02月13日 周一',
        'businessClass': {'available': true, 'count': '183张'},
        'firstClass': {'available': true, 'count': '有'},
        'secondClass': {'available': true, 'count': '有'},
      },
      {
        'trainNumber': 'G1255',
        'departureTime': '09:10',
        'arrivalTime': '11:50',
        'departureStation': '大连北',
        'arrivalStation': '北京',
        'duration': '1小时40分',
        'date': '02月13日 周一',
        'businessClass': {'available': false, 'count': '无'},
        'firstClass': {'available': true, 'count': '9张'},
        'secondClass': {'available': true, 'count': '有'},
      },
      {
        'trainNumber': 'G1255',
        'departureTime': '10:30',
        'arrivalTime': '14:05',
        'departureStation': '大连',
        'arrivalStation': '北京南站',
        'duration': '1小时40分',
        'date': '02月13日 周一',
        'businessClass': {'available': true, 'count': '183张'},
        'firstClass': {'available': true, 'count': '有'},
        'secondClass': {'available': true, 'count': '有'},
      },
    ]);
  }

  // 选择车型
  void onTrainTypeSelected(String type) {
    selectedTrainType.value = type;
  }

  // 选择出发时间
  void onDepartureTimeSelected(String time) {
    selectedDepartureTime.value = time;
  }

  // 选择出发车站
  void onDepartureStationSelected(String station) {
    selectedDepartureStation.value = station;
  }

  // 选择到达车站
  void onArrivalStationSelected(String station) {
    selectedArrivalStation.value = station;
  }

  // 选择座位类型
  void onSeatTypeSelected(String seatType) {
    selectedSeatType.value = seatType;
  }

  // 排序按钮
  void onSortTap() {
    Get.snackbar('排序', '打开排序选项');
  }

  // 发车时间排序
  void onDepartureTimeTap() {
    Get.snackbar('排序', '按发车时间排序');
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
