import 'package:get/get.dart';

class FaceLoginController extends GetxController {
  FaceLoginController();

  _initData() {
    update(["face_login"]);
  }

  void onHelpTap() {
    Get.snackbar('帮助', '面容ID登录帮助');
  }

  void onFaceLogin() {
    // 模拟面容ID验证
    Get.snackbar('成功', '面容ID验证成功，登录成功！');
    // TODO: 跳转到主页面
    Get.offAllNamed('/main');
  }

  void onSwitchLoginMethod() {
    // 返回到普通登录页面
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
