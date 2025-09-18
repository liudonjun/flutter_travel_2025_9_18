import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  Widget _buildStepIndicator(
      {required int currentStep, required int totalSteps}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        bool isActive = index < currentStep;
        bool isCurrent = index == currentStep - 1;

        return Container(
          width: 120.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: isActive || isCurrent
                ? HexColor('#2BC3A1')
                : HexColor('#E8E8E8'),
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(140.h),
      child: AppBar(
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
          '注册',
          style: TextStyle(
            color: HexColor('#333333'),
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: Container(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Obx(() => _buildStepIndicator(
                currentStep: controller.currentStep.value, totalSteps: 3)),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String svgIcon,
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: HexColor('#E8E8E8'),
                width: 2.w,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 32.w),
                SvgPicture.asset(
                  svgIcon,
                  width: 40.w,
                  height: 40.w,
                  colorFilter: ColorFilter.mode(
                    HexColor('#999999'),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      onChanged: onChanged,
                      style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 32.sp,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: HexColor('#999999'),
                        size: 48.sp,
                      ),
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String svgIcon,
    required String label,
    required String hintText,
    required TextEditingController textController,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: HexColor('#E8E8E8'),
                width: 2.w,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 32.w),
                SvgPicture.asset(
                  svgIcon,
                  width: 40.w,
                  height: 40.w,
                  colorFilter: ColorFilter.mode(
                    HexColor('#999999'),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: TextField(
                    controller: textController,
                    obscureText: obscureText,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 32.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: HexColor('#CCCCCC'),
                        fontSize: 32.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                if (suffixIcon != null) suffixIcon,
                SizedBox(width: 32.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgreement() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        children: [
          Obx(() => GestureDetector(
                onTap: controller.toggleAgreement,
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: controller.isAgreed.value
                        ? HexColor('#2BC3A1')
                        : Colors.transparent,
                    border: Border.all(
                      color: controller.isAgreed.value
                          ? HexColor('#2BC3A1')
                          : HexColor('#CCCCCC'),
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: controller.isAgreed.value
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 24.w,
                        )
                      : null,
                ),
              )),
          SizedBox(width: 16.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '已阅读并同意',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                    ),
                  ),
                  TextSpan(
                    text: '《服务条款》',
                    style: TextStyle(
                      color: HexColor('#2BC3A1'),
                      fontSize: 28.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: '与',
                    style: TextStyle(
                      color: HexColor('#666666'),
                      fontSize: 28.sp,
                    ),
                  ),
                  TextSpan(
                    text: '《隐私权政策》',
                    style: TextStyle(
                      color: HexColor('#2BC3A1'),
                      fontSize: 28.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              _buildInputField(
                svgIcon: AssetsSvgs.zhanghaoSvg,
                label: '账号',
                hintText: '用户名/手机/邮箱',
                textController: controller.accountController,
                keyboardType: TextInputType.emailAddress,
              ),
              _buildInputField(
                svgIcon: AssetsSvgs.mimaSvg,
                label: '密码',
                hintText: '字母、数字或符号，6-30位',
                textController: controller.passwordController,
                obscureText: true,
              ),
            ],
          ),
        ),
        SizedBox(height: 80.h),
        _buildAgreement(),
      ],
    );
  }

  Widget _buildStep2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          _buildDropdownField(
            svgIcon: AssetsSvgs.zhengjianleixingSvg,
            label: '证件类型',
            value: controller.selectedIdType.value,
            items: controller.idTypes,
            onChanged: controller.onIdTypeChanged,
          ),
          _buildInputField(
            svgIcon: AssetsSvgs.xingmingSvg,
            label: '姓名',
            hintText: '请输入真实姓名',
            textController: controller.nameController,
          ),
          _buildInputField(
            svgIcon: AssetsSvgs.zhengjianhaomaSvg,
            label: '证件号码',
            hintText: '请输入证件号码',
            textController: controller.idNumberController,
            suffixIcon: GestureDetector(
              onTap: controller.onCameraClick,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: SvgPicture.asset(
                  AssetsSvgs.paizhaoSvg,
                  width: 48.w,
                  height: 48.w,
                  colorFilter: ColorFilter.mode(
                    HexColor('#999999'),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          _buildInputField(
            svgIcon: AssetsSvgs.zhanghaoSvg, // 使用手机图标，如果有专门的手机SVG可以替换
            label: '手机号',
            hintText: '请输入手机号',
            textController: controller.phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationDialog() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 拖拽指示器
          Container(
            width: 80.w,
            height: 8.h,
            margin: EdgeInsets.only(top: 20.h, bottom: 40.h),
            decoration: BoxDecoration(
              color: HexColor('#E8E8E8'),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          // 标题
          Text(
            '验证您的手机',
            style: TextStyle(
              color: HexColor('#333333'),
              fontSize: 40.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 32.h),
          // 说明文字
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              '请输入发送至 +86 ${controller.phoneController.text} 的5位验证码',
              style: TextStyle(
                color: HexColor('#666666'),
                fontSize: 28.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60.h),
          // 验证码输入框
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Container(
                  width: 100.w,
                  height: 120.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: HexColor('#E8E8E8'),
                      width: 2.w,
                    ),
                  ),
                  child: TextField(
                    controller: controller.codeControllers[index],
                    focusNode: controller.codeFocusNodes[index],
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    autofocus: index == 0, // 第一个输入框自动获取焦点
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#333333'),
                      height: 1.0, // 设置行高为1.0确保文字垂直居中
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    onChanged: (value) =>
                        controller.onCodeChanged(index, value),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 80.h),
          // 重新获取验证码按钮
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: GestureDetector(
              onTap: controller.onResendCode,
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
          ),
          SizedBox(height: 32.h),
          // 完成按钮
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Obx(() => GestureDetector(
                  onTap: controller.isCodeComplete.value
                      ? controller.onCompleteVerification
                      : null,
                  child: Container(
                    width: double.infinity,
                    height: 96.h,
                    decoration: BoxDecoration(
                      color: controller.isCodeComplete.value
                          ? HexColor('#2BC3A1')
                          : HexColor('#CCCCCC'),
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
                )),
          ),
          SizedBox(height: 40.h + MediaQuery.of(Get.context!).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Obx(() {
        bool canProceed = false;
        VoidCallback? onTap;

        switch (controller.currentStep.value) {
          case 1:
            canProceed = controller.canProceed.value;
            onTap = canProceed ? controller.onNext : null;
            break;
          case 2:
            canProceed = controller.canProceedStep2.value;
            onTap = canProceed ? controller.onNextStep2 : null;
            break;
          case 3:
            canProceed = controller.canProceedStep3.value;
            onTap = canProceed ? controller.onNextStep3 : null;
            break;
        }

        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 96.h,
            decoration: BoxDecoration(
              color: canProceed ? HexColor('#2BC3A1') : HexColor('#CCCCCC'),
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Center(
              child: Text(
                '下一步',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildView() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      switch (controller.currentStep.value) {
                        case 1:
                          return _buildStep1();
                        case 2:
                          return _buildStep2();
                        case 3:
                          return _buildStep3();
                        default:
                          return _buildStep1();
                      }
                    }),
                    SizedBox(height: 160.h),
                    _buildNextButton(),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        // 验证码弹出层
        Obx(() => controller.showVerificationDialog.value
            ? GestureDetector(
                onTap: controller.onCloseDialog,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      _buildVerificationDialog(),
                    ],
                  ),
                ),
              )
            : Container()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
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
