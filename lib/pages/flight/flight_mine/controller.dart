import 'package:get/get.dart';

class FlightMineController extends GetxController {
  FlightMineController();

  _initData() {
    update(["flight_mine"]);
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
