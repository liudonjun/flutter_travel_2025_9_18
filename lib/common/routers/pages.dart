import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/pages/index.dart';
import 'package:get/get.dart';

import '../../pages/face_auth/index.dart';
import '../../pages/face_login/index.dart';
import '../../pages/login/index.dart';
import '../../pages/register/index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    /// Layout 页面
    GetPage(
      name: RouteNames.main, // app 首页
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.faceLogin,
      page: () => const FaceLoginPage(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.faceAuth,
      page: () => const FaceAuthPage(),
    ),
  ];
}
