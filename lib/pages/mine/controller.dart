import 'package:flutter/material.dart';
import 'package:flutter_travel/common/i18n/index.dart';
import 'package:flutter_travel/common/services/config.dart';
import 'package:get/get.dart';

class MineController extends GetxController {
  MineController();

  // 用户是否已登录
  var isLoggedIn = false.obs;

  // 用户信息
  var userName = 'Guest User'.obs;
  var userAvatar = ''.obs;

  // 获取配置服务
  ConfigService get configService => ConfigService.to;

  // 获取当前语言
  Locale get currentLocale => configService.locale;

  _initData() {
    update(["mine"]);
  }

  void onTap() {}

  // 切换语言 - 使用配置服务
  void changeLanguage(Locale locale) {
    configService.onLocaleUpdate(locale);
    update(["mine"]);
  }

  // 切换到中文
  void changeToChinese() {
    changeLanguage(const Locale('zh', 'CN'));
  }

  // 切换到英文
  void changeToEnglish() {
    changeLanguage(const Locale('en', 'US'));
  }

  // 获取当前语言代码
  String get currentLanguageCode => currentLocale.languageCode;

  // 登录
  void login() {
    isLoggedIn.value = true;
    userName.value = LocaleKeys.commonTravelUser.tr;
    update(["mine"]);
  }

  // 退出登录
  void logout() {
    isLoggedIn.value = false;
    userName.value = LocaleKeys.commonGuest.tr;
    userAvatar.value = '';
    update(["mine"]);
  }

  // 点击设置项
  void onSettingTap(String setting) {
    Get.snackbar(
      LocaleKeys.commonSettings.tr,
      '${LocaleKeys.commonClicked.tr} $setting',
    );
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
