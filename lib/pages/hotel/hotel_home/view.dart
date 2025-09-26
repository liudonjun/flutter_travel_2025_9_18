import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/pages/hotel/hotel_detail/index.dart';
import 'package:flutter_travel/pages/hotel/hotel_home/widgets/HotelCarousel.dart';
import 'package:flutter_travel/pages/hotel/hotel_search/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelHomePage extends GetView<HotelHomeController> {
  const HotelHomePage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildAppbar(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20.w),
                child: const SingleImageCarousel(),
              ),
              // 标题行
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "探索住宿",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "查看更多 >",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 横向列表
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = controller.hotels[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(const HotelDetailPage());
                      },
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(
                          right: index == controller.hotels.length - 1 ? 0 : 12,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              // 背景图
                              Image.network(
                                hotel["image"]!,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 200,
                              ),

                              // 左上角标签
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    hotel["tag"]!,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              // 底部渐变 + 名称
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    hotel["name"]!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // 实现区域
              const SizedBox(height: 36),
              // 附近的度假村标题
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text(
                      "附近的度假村",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 28.sp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "马来西亚",
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 附近的度假村
              _buildNearbyResortSection(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildNearbyResortSection() {
    // 示例数据，如果 controller 有实际数据可替换
    final resort = controller.hotels.isNotEmpty
        ? controller.hotels.first
        : {
            "image": "https://picsum.photos/200/150",
            "tag": "9万+人去过",
            "name": "兰卡威彩虹度假酒店",
            "score": "4.5",
            "review": "126人评价",
            "price": "1899",
          };

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 图片
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              children: [
                Image.network(
                  resort["image"]!.toString(),
                  width: 160.w,
                  height: 120.w,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 8.w,
                  top: 8.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      resort["tag"]!.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 24.w),

          // 文字信息与按钮
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 酒店名称
                Text(
                  resort["name"]!.toString(),
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 12.w),

                // 评分和评价
                Row(
                  children: [
                    Text(
                      '${resort["score"]}分',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      resort["review"]!.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18.w),

                // 价格和导航按钮
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 价格
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '¥',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: resort["price"]!.toString(),
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '/起',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 导航按钮
                    GestureDetector(
                      onTap: () {
                        // 导航逻辑占位
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDD835),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.navigation,
                              size: 24.sp,
                              color: Colors.black87,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              '导航',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelHomeController>(
      init: HotelHomeController(),
      id: "hotel_home",
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, // 从上到下
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFF4D358).withOpacity(0.2), // 0%
                  const Color(0xFFF4D358).withOpacity(0.0), // 77%
                  const Color(0xFFF4D358).withOpacity(0.0), // 100%
                ],
                stops: const [
                  0.0, // 0%
                  0.77, // 77%
                  1.0, // 100%
                ],
              ),
            ),
            child: SafeArea(
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false, // 去掉返回按钮
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          // 左边 Travel
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "T",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[700], // 黄色
                  ),
                ),
                const TextSpan(
                  text: "ravel",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // 右边搜索框
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // 点击事件，例如跳转到搜索页
                        Get.to(
                          () => const HotelSearchPage(),
                        ); // 如果用 GetX，可以这样跳转
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              "你想住在哪里?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
