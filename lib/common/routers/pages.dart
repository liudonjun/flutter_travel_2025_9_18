import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/pages/flight/flight_main/index.dart';
import 'package:flutter_travel/pages/flight/flight_select_city/index.dart';
import 'package:flutter_travel/pages/index.dart';
import 'package:flutter_travel/pages/submit_order/index.dart';
import 'package:get/get.dart';

import '../../pages/add_ticket_data/index.dart';
import '../../pages/face_auth/index.dart';
import '../../pages/face_login/index.dart';
import '../../pages/flight/flight_predict/index.dart';
import '../../pages/login/index.dart';
import '../../pages/order_detail/index.dart';
import '../../pages/register/index.dart';
import '../../pages/select_ticket/index.dart';
import '../../pages/select_time/index.dart';
import '../../pages/ticket_detail/index.dart';

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
    GetPage(
      name: RouteNames.selectTicket,
      page: () => const SelectTicketPage(),
    ),
    GetPage(
      name: RouteNames.selectTime,
      page: () => const SelectTimePage(),
    ),
    GetPage(
      name: RouteNames.ticketDetail,
      page: () => const TicketDetailPage(),
    ),
    GetPage(
      name: RouteNames.addTicketData,
      page: () => const AddTicketDataPage(),
    ),
    GetPage(
      name: RouteNames.submitOrder,
      page: () => const SubmitOrderPage(),
    ),
    GetPage(
      name: RouteNames.orderDetail,
      page: () => const OrderDetailPage(),
    ),
    GetPage(
      name: RouteNames.flightMain,
      page: () => const FlightMainPage(),
    ),
    GetPage(
      name: RouteNames.flightSelectCity,
      page: () => const FlightSelectCityPage(),
    ),
    GetPage(
      name: RouteNames.flightPredict,
      page: () => const FlightPredictPage(),
    ),
  ];
}
