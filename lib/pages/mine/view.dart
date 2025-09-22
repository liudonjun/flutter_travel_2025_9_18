import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/i18n/index.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});
  // 构建语言选择器
  Widget _buildLanguageSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color:
                  ThemeColors.getTheme(ThemeType.blue).primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.language,
              color: ThemeColors.getTheme(ThemeType.blue).primary,
              size: 28.w,
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Text(
              LocaleKeys.mineLanguage.tr,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // 语言切换按钮
          GetBuilder<MineController>(
            id: "mine",
            builder: (_) => Row(
              children: [
                GestureDetector(
                  onTap: controller.changeToChinese,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: controller.currentLanguageCode == 'zh'
                          ? ThemeColors.getTheme(ThemeType.blue).primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: ThemeColors.getTheme(ThemeType.blue).primary,
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      '中文',
                      style: TextStyle(
                        color: controller.currentLanguageCode == 'zh'
                            ? Colors.white
                            : ThemeColors.getTheme(ThemeType.blue).primary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: controller.changeToEnglish,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: controller.currentLanguageCode == 'en'
                          ? ThemeColors.getTheme(ThemeType.blue).primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: ThemeColors.getTheme(ThemeType.blue).primary,
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: controller.currentLanguageCode == 'en'
                            ? Colors.white
                            : ThemeColors.getTheme(ThemeType.blue).primary,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建设置列表
  Widget _buildSettingsList() {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          // 语言设置
          _buildLanguageSelector(),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.background,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  _buildSettingsList(),
                  SizedBox(height: 100.h), // 底部安全区域
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
