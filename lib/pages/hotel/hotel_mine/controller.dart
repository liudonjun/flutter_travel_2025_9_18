import 'package:get/get.dart';

class HotelMineController extends GetxController {
  HotelMineController();

  _initData() {
    update(["hotel_mine"]);
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
