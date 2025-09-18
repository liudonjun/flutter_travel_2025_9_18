import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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

  Widget _buildForgotPassword() {
    return Positioned(
      top: 120.h,
      right: 40.w,
      child: GestureDetector(
        onTap: () {
          // TODO: 忘记密码逻辑
        },
        child: Text(
          '忘记密码',
          style: TextStyle(
            color: HexColor('#666666'),
            fontSize: 28.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 300.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image.asset(
            AssetsImages.logoPng,
            width: 120.w,
            height: 120.w,
          ),
          SizedBox(height: 40.h),
          Text(
            '伴你自由畅行',
            style: TextStyle(
              color: HexColor('#2BC3A1'),
              fontSize: 36.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Positioned(
      bottom: 200.h,
      left: 40.w,
      right: 40.w,
      child: Column(
        children: [
          // 面容ID登录按钮
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteNames.faceLogin);
            },
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
                  '面容ID登录',
                  style: TextStyle(
                    color: HexColor('#333333'),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          // 账号登录按钮
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteNames.register);
            },
            child: Container(
              width: double.infinity,
              height: 96.h,
              decoration: BoxDecoration(
                color: HexColor('#2BC3A1'),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Center(
                child: Text(
                  '账号登录',
                  style: TextStyle(
                    color: Colors.white,
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

  Widget _buildBottomText() {
    return Positioned(
      bottom: 80.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '还没有账号？',
            style: TextStyle(
              color: HexColor('#666666'),
              fontSize: 28.sp,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteNames.register);
            },
            child: Text(
              '立即注册',
              style: TextStyle(
                color: HexColor('#2BC3A1'),
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return Stack(
      children: [
        _buildBackgroundImage(),
        _buildForgotPassword(),
        _buildLogo(),
        _buildLoginForm(),
        _buildBottomText(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}
