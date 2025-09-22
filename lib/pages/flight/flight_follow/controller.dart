import 'package:get/get.dart';

class FlightFollowController extends GetxController {
  FlightFollowController();

  _initData() {
    update(["flight_follow"]);
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
