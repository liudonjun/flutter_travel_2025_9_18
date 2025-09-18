import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class FaceLoginPage extends GetView<FaceLoginController> {
  const FaceLoginPage({super.key});

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
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.help_outline,
            color: HexColor('#333333'),
            size: 48.sp,
          ),
          onPressed: controller.onHelpTap,
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Text(
            '上午好，灵感设计',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 48.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            '欢迎回来',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 48.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 120.h),
      child: Center(
        child: Text(
          '158****6688',
          style: TextStyle(
            color: HexColor('#333333'),
            fontSize: 48.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFaceIcon() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Center(
        child: SizedBox(
          width: 160.w,
          height: 160.w,
          child: Image.asset(
            AssetsImages.mianrongPng,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          // 点击验证面容ID按钮
          GestureDetector(
            onTap: controller.onFaceLogin,
            child: Container(
              width: double.infinity,
              height: 96.h,
              decoration: BoxDecoration(
                color: HexColor('#2BC3A1'),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Center(
                child: Text(
                  '点击验证面容ID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          // 切换登录方式按钮
          GestureDetector(
            onTap: controller.onSwitchLoginMethod,
            child: Container(
              width: double.infinity,
              height: 96.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48.r),
                border: Border.all(
                  color: HexColor('#E8E8E8'),
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Text(
                  '切换登录方式',
                  style: TextStyle(
                    color: HexColor('#666666'),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return Column(
      children: [
        _buildGreeting(),
        _buildPhoneNumber(),
        Expanded(
          child: _buildFaceIcon(),
        ),
        _buildButtons(),
        SizedBox(height: 60.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceLoginController>(
      init: FaceLoginController(),
      id: "face_login",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
