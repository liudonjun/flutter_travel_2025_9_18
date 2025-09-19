import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class AddTicketDataPage extends GetView<AddTicketDataController> {
  const AddTicketDataPage({super.key});

  // 构建顶部火车信息
  Widget _buildTrainInfo() {
    return Obx(() => Container(
          padding: EdgeInsets.all(32.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Row(
            children: [
              // 出发信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.trainInfo['date'],
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      controller.trainInfo['departureTime'],
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
                          controller.trainInfo['departureStation'],
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

              // 中间列车信息
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: HexColor('#F5F5F5'),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      controller.trainInfo['trainNumber'],
                      style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
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
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    controller.trainInfo['duration'],
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
                      controller.trainInfo['date'],
                      style: TextStyle(
                        color: HexColor('#666666'),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      controller.trainInfo['arrivalTime'],
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
                          controller.trainInfo['arrivalStation'],
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
        ));
  }

  // 构建乘车人列表
  Widget _buildPassengerList() {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Column(
            children: [
              // 乘车人列表
              ...controller.passengers.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> passenger = entry.value;
                return _buildPassengerItem(passenger, index);
              }),
              // 添加乘车人按钮
              GestureDetector(
                onTap: controller.addPassenger,
                child: Container(
                  padding: EdgeInsets.all(32.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AssetsSvgs.tianjiaSvg,
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '添加乘车人',
                        style: TextStyle(
                          color: HexColor('#14B2B5'),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // 构建乘车人项
  Widget _buildPassengerItem(Map<String, dynamic> passenger, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                passenger['name'],
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: passenger['type'] == '成人票'
                        ? HexColor('#14B2B5')
                        : HexColor('#FFA500'),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  passenger['type'],
                  style: TextStyle(
                    color: passenger['type'] == '成人票'
                        ? HexColor('#14B2B5')
                        : HexColor('#FFA500'),
                    fontSize: 20.sp,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => controller.deletePassenger(index),
                child: Icon(
                  Icons.delete_outline,
                  color: HexColor('#CCCCCC'),
                  size: 48.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                '身份证: ${passenger['idCard']}',
                style: TextStyle(
                  color: HexColor('#666666'),
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '手机号: ${passenger['phone']}',
                style: TextStyle(
                  color: HexColor('#666666'),
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建座位选择
  Widget _buildSeatSelection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(32.w),
            child: Row(
              children: [
                Text(
                  '座位选择',
                  style: TextStyle(
                    color: HexColor('#333333'),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Obx(() => Text(
                      controller.selectedSeats.value,
                      style: TextStyle(
                        color: HexColor('#14B2B5'),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
          // 座位地图
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Obx(() => Column(
                  children: controller.seatMap.asMap().entries.map((entry) {
                    int rowIndex = entry.key;
                    List<Map<String, dynamic>> row = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: row.asMap().entries.map((seatEntry) {
                          int colIndex = seatEntry.key;
                          Map<String, dynamic> seat = seatEntry.value;
                          return _buildSeatItem(seat, rowIndex, colIndex);
                        }).toList(),
                      ),
                    );
                  }).toList(),
                )),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  // 构建座位项
  Widget _buildSeatItem(Map<String, dynamic> seat, int row, int col) {
    if (seat['type'] == 'empty') {
      return SizedBox(width: 56.w, height: 56.w);
    }

    if (seat['type'] == 'window') {
      return Container(
        color: HexColor('#F2F5F5'),
        width: 20.w,
        height: 60.w,
        alignment: Alignment.center,
        child: Text(
          '靠窗',
          style: TextStyle(color: HexColor('#999999'), fontSize: 18.sp),
        ),
      );
    }

    if (seat['type'] == 'aisle') {
      return Container(
        color: HexColor('#F2F5F5'),
        width: 20.w,
        height: 60.w,
        alignment: Alignment.center,
        child: Text(
          '过道',
          style: TextStyle(color: HexColor('#999999'), fontSize: 18.sp),
        ),
      );
    }

    if (seat['type'] == 'space') {
      return Container(
        color: HexColor('#F2F5F5'),
        width: 24.w,
        height: 56.w,
        alignment: Alignment.center,
        child: Text(
          '过道',
          style: TextStyle(color: HexColor('#999999'), fontSize: 20.sp),
        ),
      );
    }

    if (seat['type'] == 'label') {
      return SizedBox(width: 56.w, height: 56.w);
    }

    // 座位
    bool isSelected = seat['selected'] ?? false;
    return GestureDetector(
      onTap: () => controller.onSeatTap(row, col),
      child: SizedBox(
        width: 56.w,
        height: 56.w,
        child: Stack(
          children: [
            SvgPicture.asset(
              isSelected ? AssetsSvgs.yixuanzuoSvg : AssetsSvgs.weixuanzuoSvg,
              width: 56.w,
              height: 56.w,
            ),
            Center(
              child: Text(
                seat['number'] ?? '',
                style: TextStyle(
                  color: isSelected ? Colors.white : HexColor('#999999'),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建温馨提示
  Widget _buildWarmTips() {
    return Container(
      padding: EdgeInsets.all(32.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AssetsImages.wenxingtishiPng,
            width: 120.w,
            height: 60.w,
          ),
          SizedBox(height: 16.h),
          Text(
            '若购买席位无法选定的情况，系统将自动匹配较近的座位。',
            style: TextStyle(
              color: HexColor('#666666'),
              fontSize: 28.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // 构建底部提交按钮
  Widget _buildSubmitButton() {
    return Container(
      padding: EdgeInsets.all(32.w),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 88.w,
        child: ElevatedButton(
          onPressed: controller.submitOrder,
          style: ElevatedButton.styleFrom(
            backgroundColor: HexColor('#14B2B5'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.r),
            ),
            elevation: 0,
          ),
          child: Text(
            '提交订单',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTrainInfo(),
                _buildPassengerList(),
                _buildSeatSelection(),
                _buildWarmTips(),
                SizedBox(height: 120.h), // 为底部按钮留出空间
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTicketDataController>(
      init: AddTicketDataController(),
      id: "add_ticket_data",
      builder: (_) {
        return Scaffold(
          backgroundColor: HexColor('#F8F8F8'),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: HexColor('#333333'),
                size: 40.w,
              ),
              onPressed: controller.onBack,
            ),
            title: Text(
              '添加乘车信息',
              style: TextStyle(
                color: HexColor('#333333'),
                fontSize: 36.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {
                  // TODO: Handle explanation
                },
                child: Text(
                  '退改说明',
                  style: TextStyle(
                    color: HexColor('#14B2B5'),
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
                child: _buildSubmitButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
