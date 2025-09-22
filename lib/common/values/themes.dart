import 'package:flutter/material.dart';
import 'package:flutter_travel/common/utils/hexColor.dart';

/// 主题类型枚举
enum ThemeType {
  green,
  blue,
}

/// 主题配置类
class ThemeColors {
  final String name;
  final Color primary;
  final Color primaryLight;

  const ThemeColors({
    required this.name,
    required this.primary,
    required this.primaryLight,
  });

  /// 绿色主题
  static final green = ThemeColors(
    name: '绿色',
    primary: HexColor('#14B2B5'),
    primaryLight: HexColor('#2BC3A1'),
  );

  /// 蓝色主题
  static final blue = ThemeColors(
    name: '蓝色',
    primary: HexColor('#406EFD'),
    primaryLight: HexColor('#5A7EFF'),
  );

  /// 获取主题配置
  static ThemeColors getTheme(ThemeType type) {
    switch (type) {
      case ThemeType.green:
        return green;
      case ThemeType.blue:
        return blue;
    }
  }
}