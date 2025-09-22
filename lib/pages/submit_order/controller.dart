import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitOrderController extends GetxController {
  SubmitOrderController();

  // 倒计时相关
  final RxInt countdownMinutes = 8.obs;
  final RxInt countdownSeconds = 26.obs;
  Timer? countdownTimer;

  // 订单信息
  final RxMap<String, dynamic> orderInfo = <String, dynamic>{
    'trainNumber': 'G1251',
    'departureTime': '08:50',
    'arrivalTime': '10:30',
    'departureStation': '大连北',
    'arrivalStation': '北京',
    'duration': '1小时40分',
    'date': '02月13日 周一',
    'departureDate': '2023年02月13日 周一',
    'passenger': {
      'name': '牛魔王',
      'type': '成人票',
      'idType': '中国居民身份证',
      'seatType': '一等座',
      'carNumber': '02车',
      'seatNumber': '02B号',
      'price': 680,
    }
  }.obs;

  final RxInt totalAmount = 680.obs;

  _initData() {
    startCountdown();
    update(["submit_order"]);
  }

  // 开始倒计时
  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownSeconds.value > 0) {
        countdownSeconds.value--;
      } else if (countdownMinutes.value > 0) {
        countdownMinutes.value--;
        countdownSeconds.value = 59;
      } else {
        // 倒计时结束
        timer.cancel();
        onTimeOut();
      }
    });
  }

  // 倒计时结束处理
  void onTimeOut() {
    Get.snackbar('支付超时', '订单已取消，请重新下单');
    Get.back();
  }

  // 返回上一页
  void onBack() {
    countdownTimer?.cancel();
    Get.back();
  }

  // 查看制票规则
  void onViewTicketRules() {
    // TODO: Show ticket rules dialog
    Get.snackbar('制票规则', '显示制票规则详情');
  }

  // 取消订单
  void onCancelOrder() {
    countdownTimer?.cancel();
    Get.dialog(
      AlertDialog(
        title: const Text('取消订单'),
        content: const Text('确定要取消订单吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('继续支付'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // 关闭对话框
              Get.back(); // 返回上一页
            },
            child: const Text('确定取消'),
          ),
        ],
      ),
    );
  }

  // 立即支付
  void onPayNow() {
    countdownTimer?.cancel();
    Get.snackbar('支付成功', '订单支付成功！');
    // TODO: Navigate to payment success page
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }
}
