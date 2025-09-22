/*
 * @Description: 
 * @Author: YGJoon
 * @LastEditTime: 2025-09-22 17:39:13
 * @LastEditors: YGJoon | https://ygking.cn
 */
import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_travel/common/i18n/index.dart';
import 'package:get/get.dart';

/// 翻译类
class Translation extends Translations {
  // 当前系统语言
  // static Locale? get locale => Get.deviceLocale;

  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('zh', 'CN');

  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // 语言代码对应的翻译文本
  @override
  Map<String, Map<String, String>> get keys => {
        'en': localeEn,
        'zh': localeZh,
      };
}
