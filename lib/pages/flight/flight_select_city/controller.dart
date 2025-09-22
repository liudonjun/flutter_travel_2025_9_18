import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightSelectCityController extends GetxController {
  FlightSelectCityController();

  // 搜索控制器
  final fromCityController = TextEditingController();
  final toCityController = TextEditingController();

  // 当前选择的类型：0-出发地，1-目的地
  final RxInt currentSelectionType = 0.obs;

  // 搜索文本
  final RxString searchText = ''.obs;

  // 当前/附近城市
  final RxList<Map<String, dynamic>> nearbyCities = <Map<String, dynamic>>[
    {'name': '北京', 'code': 'BJS'},
    {'name': '天津', 'distance': '117km'},
    {'name': '唐山', 'distance': '137km'},
  ].obs;

  // 历史城市
  final RxList<Map<String, dynamic>> historyCities = <Map<String, dynamic>>[
    {'name': '北京', 'code': 'BJS'},
    {'name': '天津', 'code': 'TSN'},
    {'name': '唐山', 'code': 'TVS'},
    {'name': '武汉', 'code': 'WUH'},
  ].obs;

  // 热门城市
  final RxList<Map<String, dynamic>> hotCities = <Map<String, dynamic>>[
    {'name': '北京', 'code': 'BJS'},
    {'name': '上海', 'code': 'SHA'},
    {'name': '广州', 'code': 'CAN'},
    {'name': '深圳', 'code': 'SZX'},
    {'name': '杭州', 'code': 'HGH'},
    {'name': '成都', 'code': 'CTU'},
    {'name': '武汉', 'code': 'WUH'},
    {'name': '南京', 'code': 'NKG'},
    {'name': '重庆', 'code': 'CKG'},
    {'name': '西安', 'code': 'XIY'},
    {'name': '沈阳', 'code': 'SHE'},
    {'name': '厦门', 'code': 'XMN'},
    {'name': '长沙', 'code': 'CSX'},
    {'name': '郑州', 'code': 'CGO'},
    {'name': '天津', 'code': 'TSN'},
    {'name': '石家庄', 'code': 'SJW'},
  ].obs;

  // 按字母分组的城市
  final RxMap<String, List<Map<String, dynamic>>> alphabetCities =
      <String, List<Map<String, dynamic>>>{
    'A': [
      {'name': '北京', 'code': 'BJS'},
      {'name': '上海', 'code': 'SHA'},
      {'name': '广州', 'code': 'CAN'},
      {'name': '深圳', 'code': 'SZX'},
    ],
    'B': [
      {'name': '杭州', 'code': 'HGH'},
      {'name': '成都', 'code': 'CTU'},
      {'name': '武汉', 'code': 'WUH'},
      {'name': '南京', 'code': 'NKG'},
    ],
  }.obs;

  // 搜索城市
  void searchCities(String query) {
    searchText.value = query;
    // 这里可以实现搜索逻辑
    update(["flight_select_city"]);
  }

  // 选择城市
  void selectCity(Map<String, dynamic> city) {
    // 返回选中的城市信息
    Get.back(result: {
      'city': city,
      'type': currentSelectionType.value,
    });
  }

  // 清空搜索
  void clearSearch() {
    if (currentSelectionType.value == 0) {
      fromCityController.clear();
    } else {
      toCityController.clear();
    }
    searchText.value = '';
    update(["flight_select_city"]);
  }

  // 重新定位
  void refreshLocation() {
    // 实现重新定位逻辑
    update(["flight_select_city"]);
  }

  _initData() {
    // 获取传入的参数
    final arguments = Get.arguments;
    if (arguments != null) {
      currentSelectionType.value = arguments['type'] ?? 0;
      final String? initialText = arguments['initialCity'];
      if (initialText != null) {
        if (currentSelectionType.value == 0) {
          fromCityController.text = initialText;
        } else {
          toCityController.text = initialText;
        }
      }
    }
    update(["flight_select_city"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    fromCityController.dispose();
    toCityController.dispose();
    super.onClose();
  }
}
