import 'package:flutter/material.dart';
import 'package:flutter_travel/common/routers/index.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 当前步骤
  final RxInt currentStep = 1.obs;

  // 第一步的控制器
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isAgreed = false.obs;

  // 第二步的控制器
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final RxString selectedIdType = '中国居民身份证'.obs;

  // 第三步的控制器
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> codeControllers =
      List.generate(5, (index) => TextEditingController());
  final List<FocusNode> codeFocusNodes =
      List.generate(5, (index) => FocusNode());
  final RxBool showVerificationDialog = false.obs;

  // 证件类型选项
  final List<String> idTypes = ['中国居民身份证', '护照', '港澳通行证', '台湾通行证', '军官证', '其他'];

  // 第一步验证
  RxBool get canProceed => (accountController.text.isNotEmpty &&
          passwordController.text.length >= 6 &&
          isAgreed.value)
      .obs;

  // 第二步验证
  RxBool get canProceedStep2 =>
      (nameController.text.isNotEmpty && idNumberController.text.isNotEmpty)
          .obs;

  // 第三步验证
  RxBool get canProceedStep3 => (phoneController.text.length == 11).obs;

  // 验证码是否完整
  RxBool get isCodeComplete =>
      codeControllers.every((controller) => controller.text.isNotEmpty).obs;

  _initData() {
    // 第一步监听器
    accountController.addListener(_updateCanProceed);
    passwordController.addListener(_updateCanProceed);

    // 第二步监听器
    nameController.addListener(_updateCanProceed);
    idNumberController.addListener(_updateCanProceed);

    // 第三步监听器
    phoneController.addListener(_updateCanProceed);

    // 验证码监听器
    for (var controller in codeControllers) {
      controller.addListener(_updateCanProceed);
    }

    update(["register"]);
  }

  void _updateCanProceed() {
    update(["register"]);
  }

  // 第一步相关方法
  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

  void onNext() {
    if (canProceed.value) {
      currentStep.value = 2;
    }
  }

  // 第二步相关方法
  void onIdTypeChanged(String? newValue) {
    if (newValue != null) {
      selectedIdType.value = newValue;
    }
  }

  void onCameraClick() {
    Get.snackbar('提示', '拍照功能开发中');
  }

  void onNextStep2() {
    if (canProceedStep2.value) {
      currentStep.value = 3;
    }
  }

  // 第三步相关方法
  void onNextStep3() {
    if (canProceedStep3.value) {
      showVerificationDialog.value = true;
      _sendVerificationCode();
      // 延迟聚焦第一个输入框，确保弹窗已经显示
      Future.delayed(const Duration(milliseconds: 100), () {
        codeFocusNodes[0].requestFocus();
      });
    }
  }

  void _sendVerificationCode() {
    // 模拟发送验证码
    Get.snackbar('提示', '验证码已发送到 ${phoneController.text}');
  }

  void onCodeChanged(int index, String value) {
    if (value.isNotEmpty) {
      // 如果输入了字符，跳转到下一个输入框
      if (index < 4) {
        codeFocusNodes[index + 1].requestFocus();
      } else {
        // 最后一个输入框，失去焦点
        codeFocusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // 如果删除了字符，跳转到上一个输入框
      codeFocusNodes[index - 1].requestFocus();
    }

    // 更新按钮状态
    _updateCanProceed();
  }

  void onResendCode() {
    // 清空验证码
    for (var controller in codeControllers) {
      controller.clear();
    }
    // 重新聚焦第一个输入框
    codeFocusNodes[0].requestFocus();
    _sendVerificationCode();
  }

  void onCompleteVerification() {
    if (isCodeComplete.value) {
      String code = codeControllers.map((c) => c.text).join();
      // 验证验证码成功后跳转到刷脸验证页面
      Get.snackbar('成功', '验证码验证成功！');
      showVerificationDialog.value = false;
      // 跳转到刷脸验证页面
      Get.toNamed(RouteNames.faceAuth);
    }
  }

  void onCloseDialog() {
    showVerificationDialog.value = false;
    // 清空验证码
    for (var controller in codeControllers) {
      controller.clear();
    }
    // 释放焦点
    for (var focusNode in codeFocusNodes) {
      focusNode.unfocus();
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    accountController.dispose();
    passwordController.dispose();
    nameController.dispose();
    idNumberController.dispose();
    phoneController.dispose();
    for (var controller in codeControllers) {
      controller.dispose();
    }
    for (var focusNode in codeFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}
