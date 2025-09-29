import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlightMsgPage extends StatefulWidget {
  const FlightMsgPage({super.key});

  @override
  FlightMsgPageState createState() => FlightMsgPageState();
}

class FlightMsgPageState extends State<FlightMsgPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late FlightMsgController controller;

  // 顶部导航栏
  Widget _buildTopNavigation() {
    return Container(
      height: 136,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 87, 0.05),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 航线/航班切换按钮
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          '航线',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF406EFD),
                          ),
                        ),
                        const SizedBox(height: 11),
                        Container(
                          width: 30,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(132, 162, 255, 1),
                                Color.fromRGBO(64, 110, 253, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: const Text(
                      '航班',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF343434),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 消息卡片
  Widget _buildMessageCard({
    required String title,
    required String content,
    required String time,
    required Widget icon,
    bool showRedDot = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 87, 0.04),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题行
          Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF343434),
                  ),
                ),
              ),
              if (showRedDot)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF767B),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // 内容
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF999999),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // 分割线
          Container(
            height: 1,
            color: const Color(0xFFF6F6F6),
          ),
          const SizedBox(height: 11),
          // 时间和查看按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF999999),
                ),
              ),
              const Row(
                children: [
                  Text(
                    '立即查看',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF406EFD),
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFF406EFD),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(String title, IconData icon, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 26,
          color: isActive ? const Color(0xFF406EFD) : const Color(0xFFB3B3B3),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: isActive ? const Color(0xFF406EFD) : const Color(0xFFB3B3B3),
          ),
        ),
      ],
    );
  }

  // 购买建议图标
  Widget _buildPurchaseAdviceIcon() {
    return const SizedBox(
      width: 20,
      height: 22,
      child: Icon(
        Icons.shopping_bag_outlined,
        size: 20,
        color: Color(0xFF406EFD),
      ),
    );
  }

  // 降价通知图标
  Widget _buildPriceDropIcon() {
    return const SizedBox(
      width: 20,
      height: 22,
      child: Icon(
        Icons.trending_down,
        size: 20,
        color: Color(0xFF406EFD),
      ),
    );
  }

  // 全部消息视图
  Widget _buildMessageListView() {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildMessageCard(
              title: '购买建议变化通知',
              content: '您追踪的2022-01-20出发，杭州-北京的航线，当前购买建议变更为：立即购买',
              time: '01.01 11:39:00',
              icon: _buildPurchaseAdviceIcon(),
              showRedDot: true,
            ),
            _buildMessageCard(
              title: '降价通知',
              content: '那追踪的2022-01-20出发，杭州-北京的航线，当前最低价已降至：283元',
              time: '01.01 11:39:00',
              icon: _buildPriceDropIcon(),
              showRedDot: true,
            ),
          ],
        ),
      ),
    );
  }

  // 价格通知视图
  Widget _buildPriceNotificationView() {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildMessageCard(
              title: '降价通知',
              content: '那追踪的2022-01-20出发，杭州-北京的航线，当前最低价已降至：283元',
              time: '01.01 11:39:00',
              icon: _buildPriceDropIcon(),
              showRedDot: true,
            ),
            _buildMessageCard(
              title: '降价通知',
              content: '您追踪的2022-01-15出发，上海-广州的航线，当前最低价已降至：456元',
              time: '12.31 09:20:00',
              icon: _buildPriceDropIcon(),
            ),
          ],
        ),
      ),
    );
  }

  // 购买建议视图
  Widget _buildPurchaseAdviceView() {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildMessageCard(
              title: '购买建议变化通知',
              content: '您追踪的2022-01-20出发，杭州-北京的航线，当前购买建议变更为：立即购买',
              time: '01.01 11:39:00',
              icon: _buildPurchaseAdviceIcon(),
              showRedDot: true,
            ),
            _buildMessageCard(
              title: '购买建议变化通知',
              content: '您追踪的2022-01-25出发，深圳-成都的航线，当前购买建议变更为：再等等',
              time: '12.30 16:45:00',
              icon: _buildPurchaseAdviceIcon(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    controller = Get.put(FlightMsgController());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 自定义头部导航
  Widget _buildCustomHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 87, 0.05),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 消息中心标题
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '消息中心',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF343434),
                ),
              ),
            ),
            // 消息类型切换按钮
            TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF406EFD),
              unselectedLabelColor: const Color(0xFF343434),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3,
                  color: Color(0xFF406EFD),
                ),
                insets: EdgeInsets.symmetric(horizontal: 40),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: '价格通知'),
                Tab(text: '购买建议'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightMsgController>(
      init: controller,
      id: "flight_msg",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Column(
              children: [
                _buildCustomHeader(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildPriceNotificationView(),
                      _buildPurchaseAdviceView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
