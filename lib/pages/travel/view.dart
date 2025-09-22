import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/i18n/index.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

/// 出行
class TravelPage extends GetView<TravelController> {
  const TravelPage({super.key});

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

  // 构建顶部地区和天气显示
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.travelCurrentLocation.tr,
                        style: TextStyle(
                          color: HexColor('#181818'),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 25.w,
                      ),
                    ],
                  ),
                  Text(
                    '${LocaleKeys.travelWeatherSunny.tr} ${LocaleKeys.travelTemperature.tr}',
                    style: TextStyle(
                      color: HexColor('#999999'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetsSvgs.shousuoSvg,
                width: 48.w,
                height: 48.w,
                colorFilter: ColorFilter.mode(
                  HexColor('#181818'),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                AssetsSvgs.shaomaSvg,
                width: 48.w,
                height: 48.w,
                colorFilter: ColorFilter.mode(
                  HexColor('#181818'),
                  BlendMode.srcIn,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 构建票类选择标签
  Widget _buildTicketTypeTabs() {
    final ticketTypes = [
      LocaleKeys.travelTrainTicket.tr,
      LocaleKeys.travelFlightTicket.tr,
      LocaleKeys.travelBusTicket.tr,
    ];
    final ticketIcons = [
      AssetsSvgs.huochepiaoSvg,
      AssetsSvgs.feijipiaoSvg,
      AssetsSvgs.qichepiaoSvg,
    ];

    return Container(
      decoration: BoxDecoration(
        color: HexColor('#F7F7F7'),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w), topRight: Radius.circular(20.w)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        children: List.generate(
          ticketTypes.length,
          (index) {
            return Expanded(
              child: Obx(
                () => GestureDetector(
                  onTap: () => controller.onTicketTypeChanged(index),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.w),
                            topRight: Radius.circular(20.w)),
                        color: controller.selectedTicketType.value == index
                            ? HexColor('#FFFFFF')
                            : HexColor('#F7F7F7')),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ticketIcons[index],
                          width: 50.w,
                          height: 50.w,
                          colorFilter: ColorFilter.mode(
                            controller.selectedTicketType.value == index
                                ? HexColor('#14B2B5')
                                : HexColor('#181818'),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          ticketTypes[index],
                          style: TextStyle(
                            color: controller.selectedTicketType.value == index
                                ? HexColor('#14B2B5')
                                : HexColor('#181818'),
                            fontSize: 24.sp,
                            fontWeight:
                                controller.selectedTicketType.value == index
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // 构建出发到达选择区域
  Widget _buildCitySelection() {
    return Container(
      margin: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.w),
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            20.w,
          ),
          bottomRight: Radius.circular(
            20.w,
          ),
        ),
      ),
      child: Column(
        children: [
          /// 出发地
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.travelDeparture.tr,
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Obx(() => GestureDetector(
                          onTap: controller.onDepartureCityTap,
                          child: Text(
                            controller.departureCity.value,
                            style: TextStyle(
                              color: HexColor('#333333'),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: controller.onSwapCities,
                child: Container(
                  width: 86.w,
                  height: 86.w,
                  padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                    color: HexColor('#14B2B5'),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: SvgPicture.asset(
                    AssetsSvgs.qiehuanSvg,
                    width: 20.w,
                    height: 20.w,
                    colorFilter: ColorFilter.mode(
                      HexColor('#ffffff'),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      LocaleKeys.travelArrival.tr,
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Obx(() => GestureDetector(
                          onTap: controller.onArrivalCityTap,
                          child: Text(
                            controller.arrivalCity.value,
                            style: TextStyle(
                              color: HexColor('#333333'),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          // 日期
          SizedBox(
            height: 40.w,
          ),
          Divider(
            height: .5.w,
            color: HexColor('#F6F6F6'),
          ),
          SizedBox(
            height: 20.w,
          ),
          Row(
            children: [
              Text(
                '01月30日',
                style: TextStyle(
                  fontSize: 44.sp,
                  color: HexColor('#181818'),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                LocaleKeys.travelToday.tr,
                style: TextStyle(fontSize: 28.sp, color: HexColor('#999999')),
              ),
            ],
          ),
          SizedBox(
            height: 20.w,
          ),
          Divider(
            height: .5.w,
            color: HexColor('#F6F6F6'),
          ),
          SizedBox(
            height: 20.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsSvgs.gouxuanSvg,
                    width: 32.w,
                    height: 32.w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    LocaleKeys.travelStudentTicket.tr,
                    style:
                        TextStyle(fontSize: 28.sp, color: HexColor('#999999')),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      HexColor('#14B2B5').withOpacity(0.5),
                      HexColor('#14B2B5').withOpacity(0.1),
                    ])),
                    child: Text(
                      LocaleKeys.travelStudentNotice.tr,
                      style: TextStyle(
                          fontSize: 20.sp, color: HexColor('#14B2B5')),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsSvgs.weixuanSvg,
                    width: 32.w,
                    height: 32.w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    LocaleKeys.travelHighSpeedTrain.tr,
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: HexColor('#181818'),
                    ),
                  ),
                ],
              )
            ],
          ),
          // ttttt
          _buildSearchButton(),
          SizedBox(
            height: 20.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '北京 - 广州',
                    style: TextStyle(
                      color: HexColor('#B3B3B3'),
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    '成都 - 杭州',
                    style: TextStyle(
                      color: HexColor('#B3B3B3'),
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsSvgs.shanchulishiSvg,
                    width: 32.w,
                    height: 32.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    LocaleKeys.travelClearHistory.tr,
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: HexColor('#656565'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // 构建查询按钮
  Widget _buildSearchButton() {
    return Container(
      margin: EdgeInsets.only(top: 30.w),
      child: GestureDetector(
        onTap: controller.onSearchTickets,
        child: Container(
          width: double.infinity,
          height: 96.w,
          decoration: BoxDecoration(
            color: HexColor('#2BC3A1'),
            borderRadius: BorderRadius.circular(48.r),
          ),
          child: Center(
            child: Text(
              LocaleKeys.travelSearchTickets.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 构建历史记录列表
  Widget _buildHistoryList() {
    return Obx(() => Column(
          children: controller.historyRecords.map((record) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
              child: GestureDetector(
                onTap: () => controller.onHistoryItemTap(record),
                child: Container(
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      record['type'] == '1'
                          ? SvgPicture.asset(
                              AssetsSvgs.huochepiao1Svg,
                              width: 48.w,
                              height: 48.w,
                            )
                          : SvgPicture.asset(
                              AssetsSvgs.feijipiao1Svg,
                              width: 48.w,
                              height: 48.w,
                            ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.travelMyTrip.tr,
                                  style: TextStyle(
                                    color: HexColor('#999999'),
                                    fontSize: 24.sp,
                                  ),
                                ),
                                Text(
                                  record['trainNumber'] ?? '',
                                  style: TextStyle(
                                    color: HexColor('#181818'),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  record['route'] ?? '',
                                  style: TextStyle(
                                    color: HexColor('#181818'),
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.travelDepartureTime.tr,
                                  style: TextStyle(
                                    color: HexColor('#999999'),
                                    fontSize: 24.sp,
                                  ),
                                ),
                                Text(
                                  record['time'] ?? '',
                                  style: TextStyle(
                                    color: HexColor('#181818'),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.travelTicketDetails.tr,
                            style: TextStyle(
                              color: HexColor('#999999'),
                              fontSize: 24.sp,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.chevron_right,
                            size: 25.w,
                            color: HexColor('#999999'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }

  // 构建接驿专车区域
  Widget _buildTransferSection() {
    return Container(
      margin: EdgeInsets.all(40.w),
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsImages.qicheyulanPng,
            width: 80.w,
            height: 80.w,
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.travelTransferService.tr,
                  style: TextStyle(
                    color: HexColor('#333333'),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  LocaleKeys.travelTransferDescription.tr,
                  style: TextStyle(
                    color: HexColor('#666666'),
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: controller.onBookTransfer,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: HexColor('#2BC3A1'),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                LocaleKeys.travelBook.tr,
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

  // 主视图
  Widget _buildView() {
    return Stack(
      children: [
        _buildBackgroundImage(),
        SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTicketTypeTabs(),
                      _buildCitySelection(),
                      _buildHistoryList(),
                      _buildTransferSection(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelController>(
      init: TravelController(),
      id: "travel",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
