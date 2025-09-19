import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

class TicketDetailController extends GetxController {
  TicketDetailController();

  // 车票详情数据
  final RxMap<String, dynamic> ticketDetail = <String, dynamic>{
    'trainNumber': 'G1251',
    'departureTime': '08:50',
    'arrivalTime': '10:30',
    'departureStation': '大连北',
    'arrivalStation': '北京',
    'duration': '1小时40分',
    'date': '02月13日 周一',
    'departureDate': '02月13日 周一出发',
    'distance': '',
    'seatTypes': [
      {
        'type': '商务座/无',
        'price': 0,
        'available': false,
        'status': '候补',
      },
      {
        'type': '一等座/9张',
        'price': 680,
        'available': true,
        'status': '预订',
      },
      {
        'type': '二等座/有票',
        'price': 365,
        'available': true,
        'status': '预订',
      },
      {
        'type': '无座',
        'price': 365,
        'available': true,
        'status': '预订',
      },
    ]
  }.obs;

  _initData() {
    update(["ticket_detail"]);
  }

  // 返回上一页
  void onBack() {
    Get.back();
  }

  // 选择出发说明
  void onDepartureInfoTap() {
    Get.bottomSheet(
      _buildStationInfoBottomSheet(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  // 构建车站时刻表底部弹窗
  Widget _buildStationInfoBottomSheet() {
    return Container(
      height: Get.height * 0.75,
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
            margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
            decoration: BoxDecoration(
              color: HexColor('#E8E8E8'),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          // 标题
          Text(
            'G1255时刻表',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.h),

          // 表头
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '站名',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '到达',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '发车',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '停留',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 车站列表
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  _buildStationItem('大连北', '始', true, '--', '09:10', '--'),
                  _buildStationItem(
                      '盖州西', '09:20', false, '09:20', '09:22', '2分'),
                  _buildStationItem(
                      '盘锦', '09:45', false, '09:45', '09:48', '3分'),
                  _buildStationItem(
                      '锦州北', '10:10', false, '10:10', '10:13', '3分'),
                  _buildStationItem(
                      '辽宁朝阳', '10:45', false, '10:45', '10:47', '2分'),
                  _buildStationItem(
                      '承德南', '11:20', false, '11:20', '11:32', '10分'),
                  _buildStationItem('北京朝阳', '终', true, '11:50', '--', '--'),
                ],
              ),
            ),
          ),

          SizedBox(height: 40.h + MediaQuery.of(Get.context!).padding.bottom),
        ],
      ),
    );
  }

  // 构建车站项
  Widget _buildStationItem(
      String stationName,
      String arrivalTime,
      bool isTerminal,
      String actualArrival,
      String departureTime,
      String stopTime) {
    return Row(
      children: [
        // 左侧线条和圆点
        SizedBox(
          width: 40.w,
          height: 80.h,
          child: Stack(
            children: [
              // 上半部分连接线（除了第一个站点）
              if (arrivalTime != '始')
                Positioned(
                  top: 0,
                  left: 19.w,
                  child: Container(
                    width: 2.w,
                    height: 40.h, // 到圆点中心
                    color: HexColor('#E8E8E8'),
                  ),
                ),
              // 下半部分连接线（除了最后一个站点）
              if (arrivalTime != '终')
                Positioned(
                  top: 40.h, // 从圆点中心开始
                  left: 19.w,
                  child: Container(
                    width: 2.w,
                    height: 40.h, // 到底部
                    color: HexColor('#E8E8E8'),
                  ),
                ),
              // 圆点
              Positioned(
                top: 36.w, // 垂直居中
                left: 8.w, // 水平居中
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: isTerminal ? HexColor('#14B2B5') : Colors.white,
                    border: Border.all(
                      color: isTerminal
                          ? HexColor('#14B2B5')
                          : HexColor('#CCCCCC'),
                      width: 3.w,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),

        // 车站信息
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text(
                stationName,
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              if (isTerminal && arrivalTime == '始') ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: HexColor('#FFA500'),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '始',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ] else if (isTerminal && arrivalTime == '终') ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: HexColor('#14B2B5'),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '终',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // 到达时间
        Expanded(
          flex: 2,
          child: Text(
            actualArrival,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: actualArrival == '--'
                  ? HexColor('#CCCCCC')
                  : HexColor('#333333'),
              fontSize: 28.sp,
            ),
          ),
        ),

        // 发车时间
        Expanded(
          flex: 2,
          child: Text(
            departureTime,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: departureTime == '--'
                  ? HexColor('#CCCCCC')
                  : HexColor('#333333'),
              fontSize: 28.sp,
            ),
          ),
        ),

        // 停留时间
        Expanded(
          flex: 1,
          child: Text(
            stopTime,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  stopTime == '--' ? HexColor('#CCCCCC') : HexColor('#666666'),
              fontSize: 24.sp,
            ),
          ),
        ),
      ],
    );
  }

  // 点击座位预订
  void onSeatBookTap(Map<String, dynamic> seatInfo) {
    if (seatInfo['available']) {
      Get.toNamed(RouteNames.addTicketData);
      // Get.snackbar('预订', '预订 ${seatInfo['type']} - ¥${seatInfo['price']}');
    } else {
      Get.snackbar('候补', '加入候补列表');
    }
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
