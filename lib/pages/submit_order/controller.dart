import 'package:get/get.dart';

class SubmitOrderController extends GetxController {
  SubmitOrderController();

  _initData() {
    update(["submit_order"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
