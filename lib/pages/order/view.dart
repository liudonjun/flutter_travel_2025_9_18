import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/pages/order_detail/index.dart';
import 'package:get/get.dart';

// import '../order_detail/view.dart';
import 'index.dart';

class RoundedUnderlineTabIndicator extends Decoration {
  final Color color;
  final double width;
  final double radius;
  final EdgeInsetsGeometry insets;

  const RoundedUnderlineTabIndicator({
    required this.color,
    this.width = 4.0,
    this.radius = 4.0,
    this.insets = EdgeInsets.zero,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedUnderlinePainter(this, onChanged);
  }
}

class _RoundedUnderlinePainter extends BoxPainter {
  final RoundedUnderlineTabIndicator decoration;

  _RoundedUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = decoration.color
      ..style = PaintingStyle.fill;

    final Rect indicator = Rect.fromLTWH(
      rect.left + decoration.insets.horizontal / 2,
      rect.bottom - decoration.width,
      rect.width - decoration.insets.horizontal,
      decoration.width,
    );

    final RRect rrect = RRect.fromRectAndCorners(
      indicator,
      topLeft: Radius.circular(decoration.radius),
      topRight: Radius.circular(decoration.radius),
    );

    canvas.drawRRect(rrect, paint);
  }
}

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  // 构建Tab栏
  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: controller.tabController,
        onTap: controller.onTabChanged,
        indicator: RoundedUnderlineTabIndicator(
          color: HexColor('#14B2B5'),
          width: 10.w,
          radius: 6.r, // 上边圆角
          insets: EdgeInsets.symmetric(horizontal: 10.w),
        ),
        dividerColor: Colors.transparent,
        labelColor: HexColor('#14B2B5'),
        unselectedLabelColor: HexColor('#666666'),
        tabs: controller.tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }

  // 构建订单项
  Widget _buildOrderItem(Map<String, dynamic> order) {
    return GestureDetector(
      onTap: () {
        Get.to(OrderDetailPage());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部：车次和价格
            Row(
              children: [
                // 图标和车次
                Row(
                  children: [
                    order['type'] == 'train'
                        ? SvgPicture.asset(
                            AssetsSvgs.huochepiao1Svg,
                            width: 48.w,
                            height: 48.w,
                          )
                        : SvgPicture.asset(
                            AssetsSvgs.feijipiao1Svg,
                            width: 48.w,
                            height: 48.w,
                          ),
                    SizedBox(width: 16.w),
                    Text(
                      order['id'],
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    // 路线
                    Text(
                      order['route'],
                      style: TextStyle(
                        color: HexColor('#181818'),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // 价格
                if (order['price'] > 0)
                  Text(
                    '¥ ${order['price']}',
                    style: TextStyle(
                      color: HexColor('#FF8D1A'),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                if (order['price'] == 0)
                  Text(
                    '已出票｜删除',
                    style: TextStyle(
                      color: HexColor('#999999'),
                      fontSize: 24.sp,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.h),

            // 出发时间
            Row(
              children: [
                Text(
                  '出发时间：',
                  style: TextStyle(
                    color: HexColor('#999999'),
                    fontSize: 24.sp,
                  ),
                ),
                Text(
                  order['departureTime'],
                  style: TextStyle(
                    color: HexColor('#181818'),
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),

            // 座位信息或特殊信息
            if (order['seats'] != null) ...[
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...order['seats'].map<Widget>(
                        (seat) => Container(
                          margin: EdgeInsets.only(right: 16.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: HexColor('#F5F5F5'),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            seat,
                            style: TextStyle(
                              color: HexColor('#666666'),
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: order['type'] == 'train'
                                ? HexColor('#FFA500')
                                : HexColor('#14B2B5'),
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          '可退票',
                          style: TextStyle(
                            color: order['type'] == 'train'
                                ? HexColor('#FFA500')
                                : HexColor('#14B2B5'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: order['type'] == 'train'
                                ? HexColor('#FFA500')
                                : HexColor('#14B2B5'),
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          '已出票',
                          style: TextStyle(
                            color: order['type'] == 'train'
                                ? HexColor('#FFA500')
                                : HexColor('#14B2B5'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],

            if (order['departure'] != null) ...[
              SizedBox(height: 16.h),
              Text(
                order['departure'],
                style: TextStyle(
                  color: HexColor('#666666'),
                  fontSize: 28.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // 构建空状态
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          Text(
            '以下为一年前的订单',
            style: TextStyle(
              color: HexColor('#CCCCCC'),
              fontSize: 28.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            '部分订单仅支持查看概要',
            style: TextStyle(
              color: HexColor('#CCCCCC'),
              fontSize: 24.sp,
            ),
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: Obx(() {
            final orders = controller.filteredOrders;
            if (orders.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 16.h, bottom: 32.h),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                if (index == orders.length - 1) {
                  // 最后一项后显示提示
                  return Column(
                    children: [
                      _buildOrderItem(orders[index]),
                      _buildEmptyState(),
                    ],
                  );
                }
                return _buildOrderItem(orders[index]);
              },
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      id: "order",
      builder: (_) {
        return Scaffold(
          backgroundColor: HexColor('#F8F8F8'),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: SizedBox.shrink(),
            title: Text(
              '全部订单',
              style: TextStyle(
                color: HexColor('#333333'),
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: controller.onRefundPolicy,
                child: Text(
                  '退改说明',
                  style: TextStyle(
                    color: HexColor('#14B2B5'),
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ],
          ),
          body: _buildView(),
        );
      },
    );
  }
}
