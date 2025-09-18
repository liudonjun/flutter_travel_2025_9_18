import 'package:get/get.dart';

class FaceAuthController extends GetxController {
  FaceAuthController();

  _initData() {
    update(["face_auth"]);
  }

  void onPrivacyTap() {
    Get.snackbar('提示', '生物识别服务通用规则');
  }

  void onComplete() {
    Get.snackbar('成功', '刷脸验证完成！');
    // TODO: 跳转到主页面或其他页面
    Get.offAllNamed('/main'); // 假设主页面路由是'/main'
  }

  void onRetryVerification() {
    Get.snackbar('提示', '重新获取验证码');
    // TODO: 返回验证码页面或重新发送验证码
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
