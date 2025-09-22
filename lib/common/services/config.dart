import 'dart:ui';

import 'package:flutter_travel/common/i18n/index.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

/// 配置服务
class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  Locale locale = PlatformDispatcher.instance.locale;

  @override
  void onReady() {
    super.onReady();
    initLocale();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
    Get.updateLocale(locale);
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }
}
