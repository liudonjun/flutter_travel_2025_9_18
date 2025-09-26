import 'package:get/get.dart';

class HotelMsgController extends GetxController {
  HotelMsgController();

  _initData() {
    update(["hotel_msg"]);
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
