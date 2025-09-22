import 'package:get/get.dart';

class FlightPredictController extends GetxController {
  FlightPredictController();

  // 选中的日期
  var selectedDate = '01-30'.obs;

  // 当前排序类型
  var currentSortType = '推荐排序'.obs;

  // 日历是否展开
  var isCalendarExpanded = false.obs;

  // 当前月份
  var currentMonth = '2022年2月'.obs;

  _initData() {
    update(["flight_predict"]);
  }

  void onTap() {}

  // 选择日期
  void selectDate(String date) {
    selectedDate.value = date;
    update(["flight_predict"]);
  }

  // 切换排序标签
  void changeTab(String tabName) {
    currentSortType.value = tabName;
    update(["flight_predict"]);
  }

  // 切换日历展开/收起
  void toggleCalendar() {
    isCalendarExpanded.value = !isCalendarExpanded.value;
    update(["flight_predict"]);
  }

  // 选择日历中的日期
  void selectCalendarDate(int day) {
    selectedDate.value = '02-${day.toString().padLeft(2, '0')}';
    isCalendarExpanded.value = false; // 选择后收起日历
    update(["flight_predict"]);
  }

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
