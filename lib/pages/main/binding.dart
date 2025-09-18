import 'package:flutter_travel/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
