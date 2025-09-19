import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

class TravelController extends GetxController {
  TravelController();

  // 当前选择的票类型：0-火车票，1-飞机票，2-汽车票
  final RxInt selectedTicketType = 0.obs;

  // 出发和到达城市
  final RxString departureCity = '大连'.obs;
  final RxString arrivalCity = '上海'.obs;

  // 出发日期
  final RxString departureDate = '01月30日'.obs;
  final RxString departureDateSuffix = '今天'.obs;

  // 旅客类型选择
  final RxBool isStudentTicket = true.obs;
  final RxBool isHighSpeedTrain = false.obs;

  // 历史记录
  final RxList<Map<String, String>> historyRecords = <Map<String, String>>[
    {
      'type': '1',
      'trainNumber': 'G1827',
      'route': '大连 → 上海',
      'date': '2月28日',
      'time': '20:30'
    },
    {
      'type': '2',
      'trainNumber': 'EU2280',
      'route': '上海 → 深圳',
      'date': '2月28日',
      'time': '20:30'
    }
  ].obs;

  _initData() {
    update(["travel"]);
  }

  void onTicketTypeChanged(int index) {
    selectedTicketType.value = index;
  }

  void onSwapCities() {
    String temp = departureCity.value;
    departureCity.value = arrivalCity.value;
    arrivalCity.value = temp;
  }

  void onDepartureCityTap() {
    // TODO: 打开城市选择页面
    Get.snackbar('提示', '选择出发城市');
  }

  void onArrivalCityTap() {
    // TODO: 打开城市选择页面
    Get.snackbar('提示', '选择到达城市');
  }

  void onDateTap() {
    // TODO: 打开日期选择器
    Get.snackbar('提示', '选择出发日期');
  }

  void onStudentTicketToggle() {
    isStudentTicket.value = !isStudentTicket.value;
  }

  void onHighSpeedTrainToggle() {
    isHighSpeedTrain.value = !isHighSpeedTrain.value;
  }

  void onSearchTickets() {
    Get.toNamed(RouteNames.selectTicket);
  }

  void onClearHistory() {
    historyRecords.clear();
    Get.snackbar('提示', '已清除历史记录');
  }

  void onHistoryItemTap(Map<String, String> record) {
    // TODO: 查看车票详情
    Get.snackbar('车票详情', record['trainNumber'] ?? '');
  }

  void onBookTransfer() {
    // TODO: 预订接驿专车
    Get.snackbar('预订', '正在预订接驿专车...');
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
