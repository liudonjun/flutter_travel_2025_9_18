import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class FaceAuthPage extends GetView<FaceAuthController> {
  const FaceAuthPage({super.key});

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
      title: Text(
        '身份验证',
        style: TextStyle(
          color: HexColor('#333333'),
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Text(
            '使用刷脸验证身份',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 48.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          Text(
            '验证时请注意您的穿着，以及周围环境',
            style: TextStyle(
              color: HexColor('#999999'),
              fontSize: 28.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFaceImage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 120.h),
      child: Center(
        child: SizedBox(
          width: 320.w,
          height: 320.w,
          child: Image.asset(
            AssetsImages.shuanianyanzhengPng,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyLink() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: GestureDetector(
        onTap: controller.onPrivacyTap,
        child: Text(
          '查看《生物识别服务通用规则》',
          style: TextStyle(
            color: HexColor('#666666'),
            fontSize: 28.sp,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          // 完成按钮
          GestureDetector(
            onTap: controller.onComplete,
            child: Container(
              width: double.infinity,
              height: 96.h,
              decoration: BoxDecoration(
                color: HexColor('#2BC3A1'),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Center(
                child: Text(
                  '完成',
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
          // 重新获得验证码按钮
          GestureDetector(
            onTap: controller.onRetryVerification,
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
                  '重新获得验证码',
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
        _buildTitle(),
        Expanded(
          child: _buildFaceImage(),
        ),
        _buildPrivacyLink(),
        _buildButtons(),
        SizedBox(height: 60.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceAuthController>(
      init: FaceAuthController(),
      id: "face_auth",
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
