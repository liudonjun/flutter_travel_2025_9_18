import 'package:get/get.dart';

class SelectTimeController extends GetxController {
  SelectTimeController();

  // 当前显示的年月
  final RxInt currentYear = 2022.obs;
  final RxInt currentMonth = 2.obs;

  // 选中的日期
  final RxInt selectedDay = 14.obs;

  // 今天的日期 (用于标识今天)
  final int todayDay = 1;
  final int todayMonth = 2;
  final int todayYear = 2022;

  // 获取当前月份的天数
  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  // 获取当前月份第一天是星期几 (1=周一, 7=周日)
  int getFirstDayOfWeek(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    return firstDay.weekday;
  }

  // 获取上个月的天数
  int getPreviousMonthDays(int year, int month) {
    if (month == 1) {
      return getDaysInMonth(year - 1, 12);
    } else {
      return getDaysInMonth(year, month - 1);
    }
  }

  // 生成日历数据
  List<Map<String, dynamic>> generateCalendarDays() {
    List<Map<String, dynamic>> days = [];

    final daysInMonth = getDaysInMonth(currentYear.value, currentMonth.value);
    final firstDayWeek = getFirstDayOfWeek(currentYear.value, currentMonth.value);
    final previousMonthDays = getPreviousMonthDays(currentYear.value, currentMonth.value);

    // 添加上个月的尾部日期
    for (int i = firstDayWeek - 1; i > 0; i--) {
      days.add({
        'day': previousMonthDays - i + 1,
        'isCurrentMonth': false,
        'isPreviousMonth': true,
        'isNextMonth': false,
        'isToday': false,
        'isSelected': false,
      });
    }

    // 添加当前月的日期
    for (int day = 1; day <= daysInMonth; day++) {
      final isToday = day == todayDay &&
                     currentMonth.value == todayMonth &&
                     currentYear.value == todayYear;
      final isSelected = day == selectedDay.value;

      days.add({
        'day': day,
        'isCurrentMonth': true,
        'isPreviousMonth': false,
        'isNextMonth': false,
        'isToday': isToday,
        'isSelected': isSelected,
      });
    }

    // 添加下个月的开始日期 (补全到42个格子)
    int nextMonthDay = 1;
    while (days.length < 42) {
      days.add({
        'day': nextMonthDay,
        'isCurrentMonth': false,
        'isPreviousMonth': false,
        'isNextMonth': true,
        'isToday': false,
        'isSelected': false,
      });
      nextMonthDay++;
    }

    return days;
  }

  // 获取月份中文名称
  String getMonthName(int month) {
    const monthNames = [
      '', '1月', '2月', '3月', '4月', '5月', '6月',
      '7月', '8月', '9月', '10月', '11月', '12月'
    ];
    return monthNames[month];
  }

  // 获取农历或特殊标识
  String getLunarOrSpecial(int day) {
    // 这里可以根据实际需求添加农历计算或特殊节日标识
    final lunarMap = {
      29: '初八',
      30: '初九',
      31: '初十',
      1: '十一',
      2: '十二',
      3: '十三',
      4: '立春',
      5: '十五',
      6: '十六',
      7: '十七',
      8: '十八',
      9: '十九',
      10: '二十',
      11: '廿一',
      12: '廿二',
      13: '廿三',
      14: '情人节',
      15: '廿五',
      16: '廿六',
      17: '廿七',
      18: '廿八',
      19: '雨水',
      20: '二月',
      21: '初二',
      22: '初三',
      23: '初四',
      24: '初五',
      25: '初六',
      26: '初七',
      27: '初八',
      28: '初九',
    };
    return lunarMap[day] ?? '';
  }

  _initData() {
    update(["select_time"]);
  }

  // 上一个月
  void onPreviousMonth() {
    if (currentMonth.value == 1) {
      currentMonth.value = 12;
      currentYear.value--;
    } else {
      currentMonth.value--;
    }
    update(["select_time"]);
  }

  // 下一个月
  void onNextMonth() {
    if (currentMonth.value == 12) {
      currentMonth.value = 1;
      currentYear.value++;
    } else {
      currentMonth.value++;
    }
    update(["select_time"]);
  }

  // 选择日期
  void onDateSelected(int day) {
    selectedDay.value = day;
    update(["select_time"]);
  }

  // 返回
  void onBack() {
    Get.back(result: {
      'year': currentYear.value,
      'month': currentMonth.value,
      'day': selectedDay.value,
    });
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
