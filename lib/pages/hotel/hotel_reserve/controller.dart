import 'package:get/get.dart';

class HotelReserveController extends GetxController {
  HotelReserveController();

  _initData() {
    update(["hotel_reserve"]);
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
