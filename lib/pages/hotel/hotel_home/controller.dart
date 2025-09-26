import 'package:get/get.dart';

class HotelHomeController extends GetxController {
  HotelHomeController();

  final hotels = [
    {
      "image": "https://picsum.photos/id/1018/400/300",
      "tag": "龙目岛",
      "name": "库塔英达酒店",
      "score": "4.5",
      "review": "126人评价",
      "price": "1899",
    },
    {
      "image": "https://picsum.photos/id/1015/400/300",
      "tag": "巴厘岛",
      "name": "Neano Escape",
      "score": "4.5",
      "review": "126人评价",
      "price": "1899",
    },
    {
      "image": "https://picsum.photos/id/1016/400/300",
      "tag": "拉贾·安帕特",
      "name": "马拉斯里里森酒店",
      "score": "4.5",
      "review": "126人评价",
      "price": "1899",
    },
  ];

  _initData() {
    update(["hotel_home"]);
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
