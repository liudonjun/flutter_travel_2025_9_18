import 'package:flutter_travel/pages/hotel/hotel_reserve_detail/index.dart';
import 'package:get/get.dart';

class HotelDetailController extends GetxController {
  HotelDetailController();

  // 酒店图片轮播
  final List<String> hotelImages = [
    "https://picsum.photos/400/250?random=1",
    "https://picsum.photos/400/250?random=2",
    "https://picsum.photos/400/250?random=3",
  ];

  // 酒店信息
  final Map<String, dynamic> hotelInfo = {
    "name": "巴厘岛朝吉安海滩普尔曼酒店",
    "nameEn": "Pullman Bali Legian Beach",
    "rating": 4.7,
    "openYear": "1999年开业",
    "hasWifi": true,
    "hasLaundry": true,
    "reviewScore": "干净卫生，适合出差游玩",
    "reviewCount": 1380,
    "location": "位于：韩国际机场20分钟",
    "subway": "Jalan Melasti, Legian"
  };

  // 房型数据
  final List<Map<String, dynamic>> roomTypes = [
    {
      "name": "私人游泳池-豪华大床房",
      "size": "1张1.8米大床",
      "capacity": "2人入住",
      "area": "80m²",
      "price": "1899",
      "image": "https://picsum.photos/300/200?random=10",
    },
    {
      "name": "私人游泳池-豪华别墅",
      "size": "4张1.8米大床",
      "capacity": "8人入住",
      "area": "260m²",
      "price": "16899",
      "image": "https://picsum.photos/300/200?random=11",
    },
  ];

  // 选择的日期
  var checkInDate = "2月18日".obs;
  var checkOutDate = "2月24日".obs;
  var selectedTab = 0.obs;

  // 预订相关状态
  var bookingCheckInDate = "".obs;
  var bookingCheckOutDate = "".obs;
  var selectedRoomCount = 1.obs;
  var selectedGuestCount = 2.obs;
  var currentBookingRoom = Rxn<Map<String, dynamic>>();

  // 房间数量选项
  final List<String> roomCountOptions = ["1间", "2间", "3间", "4间", "5间"];

  // 入住人数选项
  final List<String> guestCountOptions = [
    "1人",
    "2人",
    "3人",
    "4人",
    "5人",
    "6人",
    "7人",
    "8人"
  ];

  // 房型筛选标签
  final List<String> roomTabs = ["热门推荐", "大床房", "双床房", "海景房", "独立别墅"];

  _initData() {
    update(["hotel_detail"]);
  }

  void onTap() {}

  void onTabChange(int index) {
    selectedTab.value = index;
  }

  void onBookRoom(Map<String, dynamic> room) {
    currentBookingRoom.value = room;
    bookingCheckInDate.value = checkInDate.value;
    bookingCheckOutDate.value = checkOutDate.value;
  }

  void onRoomCountChange(int index) {
    selectedRoomCount.value = index + 1;
  }

  void onGuestCountChange(int index) {
    selectedGuestCount.value = index + 1;
  }

  void onConfirmBooking() {
    // 传递预订数据到预订详情页面
    final bookingData = {
      'room': currentBookingRoom.value,
      'checkInDate': bookingCheckInDate.value,
      'checkOutDate': bookingCheckOutDate.value,
      'roomCount': selectedRoomCount.value,
      'guestCount': selectedGuestCount.value,
    };

    Get.to(
      () => HotelReserveDetailPage(),
      arguments: bookingData,
    );
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
