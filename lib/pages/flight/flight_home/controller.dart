import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

class FlightHomeController extends GetxController {
  FlightHomeController();

  // 是否为往返模式
  final RxBool isRoundTrip = false.obs;

  // 出发城市和到达城市
  final RxString fromCity = '北京'.obs;
  final RxString toCity = '杭州'.obs;

  // 选择的日期
  final RxString selectedDate = '01月30日'.obs;
  final RxString selectedWeekday = '周四'.obs;

  // 统计数据
  final RxString dataCount = '129,492'.obs;
  final RxString userCount = '67,583'.obs;
  final RxString savedAmount = '3,897'.obs;

  // 热门航线数据
  final RxList<Map<String, dynamic>> popularRoutes = <Map<String, dynamic>>[
    {
      'route': '北京 — 广州',
      'price': '427',
      'status': '余票充足',
      'statusColor': '#FF8D1A',
    },
    {
      'route': '北京 — 武汉',
      'price': '283',
      'status': '仅剩13张',
      'statusColor': '#FF4444',
    },
    {
      'route': '北京 — 西宁',
      'price': '318',
      'date': '01月09日 周四',
      'status': '仅剩12张',
      'statusColor': '#FF4444',
    },
    {
      'route': '北京 — 上海',
      'price': '229',
      'date': '01月19日 周六',
      'status': '仅剩16张',
      'statusColor': '#FF4444',
    },
    {
      'route': '北京 — 长沙',
      'price': '291',
      'status': '',
      'statusColor': '',
    },
    {
      'route': '北京 — 郑州',
      'price': '216',
      'status': '',
      'statusColor': '',
    },
  ].obs;

  _initData() {
    update(["flight_home"]);
  }

  // 切换单程/往返
  void toggleTripType() {
    isRoundTrip.value = !isRoundTrip.value;
  }

  // 交换城市
  void swapCities() {
    String temp = fromCity.value;
    fromCity.value = toCity.value;
    toCity.value = temp;
  }

  // 选择出发城市
  void selectFromCity() async {
    final result = await Get.toNamed(
      RouteNames.flightSelectCity,
      arguments: {
        'type': 0, // 0-出发地，1-目的地
        'initialCity': fromCity.value,
      },
    );

    if (result != null && result['city'] != null) {
      fromCity.value = result['city']['name'];
    }
  }

  // 选择到达城市
  void selectToCity() async {
    final result = await Get.toNamed(
      RouteNames.flightSelectCity,
      arguments: {
        'type': 1, // 0-出发地，1-目的地
        'initialCity': toCity.value,
      },
    );

    if (result != null && result['city'] != null) {
      toCity.value = result['city']['name'];
    }
  }

  // 选择日期
  void selectDate() {
    // TODO: 实现日期选择
  }

  // 机票预测
  void predictTicket() {
    Get.toNamed(RouteNames.flightPredict);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
