import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class TicketDetailPage extends GetView<TicketDetailController> {
  const TicketDetailPage({super.key});

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
      title: Text(
        '车票详情',
        style: TextStyle(
          color: HexColor('#333333'),
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          child: Text(
            '退改规则',
            style: TextStyle(
              color: HexColor('#14B2B5'),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  // 构建车票信息卡片
  Widget _buildTicketInfo() {
    var ticket = controller.ticketDetail;
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 32.w, bottom: 20.w),
      padding: EdgeInsets.all(26.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Obx(() => Column(
            children: [
              // 车次和日期
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
                        GestureDetector(
                          onTap: controller.onDepartureInfoTap,
                          child: Container(
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
            ],
          )),
    );
  }

  // 构建座位类型项
  Widget _buildSeatTypeItem(Map<String, dynamic> seatInfo) {
    return Container(
      padding: EdgeInsets.all(32.w),
      child: Row(
        children: [
          // 座位类型信息
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  seatInfo['type'],
                  style: TextStyle(
                    color: HexColor('#181818'),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // 预订按钮
          Row(
            children: [
              if (seatInfo['price'] > 0) ...[
                Text(
                  '¥${seatInfo['price']}',
                  style: TextStyle(
                    color: HexColor('#FF8D1A'),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
              GestureDetector(
                onTap: () => controller.onSeatBookTap(seatInfo),
                child: Container(
                  width: 128.w,
                  height: 72.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: seatInfo['available']
                        ? HexColor('#14B2B5')
                        : HexColor('#CCCCCC'),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    seatInfo['status'],
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
        ],
      ),
    );
  }

  // 构建座位列表
  Widget _buildSeatList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Column(
                children: controller.ticketDetail['seatTypes']
                    .map<Widget>((seat) => _buildSeatTypeItem(seat))
                    .toList(),
              )),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTicketInfo(),
          _buildSeatList(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TicketDetailController>(
      init: TicketDetailController(),
      id: "ticket_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
