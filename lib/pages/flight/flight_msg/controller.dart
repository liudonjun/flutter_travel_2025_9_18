import 'package:get/get.dart';

class FlightMsgController extends GetxController {
  FlightMsgController();

  _initData() {
    update(["flight_msg"]);
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
