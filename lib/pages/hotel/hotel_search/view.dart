import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotelSearchPage extends GetView<HotelSearchController> {
  const HotelSearchPage({super.key});

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 48.w, 40.w, 0),
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 40.sp,
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: TextFormField(
              initialValue: controller.isSearching.value
                  ? controller.searchQuery.value
                  : "",
              onChanged: (value) {
                controller.setSearchQuery(value);
              },
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: "你想住在哪里？",
                hintStyle: TextStyle(
                  fontSize: 28.sp,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Container(
            width: 104.w,
            height: 64.h,
            child: ElevatedButton(
              onPressed: () {
                if (controller.isSearching.value) {
                  controller.cancelSearch();
                } else {
                  controller.startSearch();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFBDE44),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Obx(() => Text(
                    controller.isSearching.value ? "取消" : "搜索",
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Color(0xFF1B1B1B),
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTags() {
    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 32.w, 40.w, 0),
      child: Wrap(
        spacing: 20.w,
        runSpacing: 16.h,
        children: [
          _buildSearchTag("附近", Icons.location_on),
          _buildSearchTag("拉贾·安帕特", null),
          _buildSearchTag("巴厘岛", null),
          _buildSearchTag("万隆", null),
        ],
      ),
    );
  }

  Widget _buildSearchTag(String text, IconData? icon) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 22.sp,
              color: Colors.grey.shade600,
            ),
            SizedBox(width: 8.w),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBottomSheet() {
    return Container(
      height: 1368.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "筛选",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1B1B1B),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 34.w,
                    height: 34.h,
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 排序
                  Text(
                    "排序",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _buildSortSection(),
                  SizedBox(height: 64.h),

                  // 类别选择
                  Text(
                    "类别选择",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _buildCategorySection(),
                  SizedBox(height: 64.h),

                  // 价格范围
                  Text(
                    "价格范围",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _buildPriceRangeSlider(),
                  SizedBox(height: 64.h),

                  // 包含设施
                  Text(
                    "包含设施",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _buildFacilitySection(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),

          // Bottom buttons
          Container(
            height: 166.h,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x080C0C0C),
                  blurRadius: 28,
                  offset: Offset(0, -6),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 88.h,
                    child: OutlinedButton(
                      onPressed: () {
                        // 重置筛选条件
                        controller.minPrice.value = 0;
                        controller.maxPrice.value = 10000;
                        controller.sortType.value = 'recommended';
                        controller.categoryType.value = 'all';
                        controller.selectedFacilities.assignAll(
                            [false, false, false, false, false, false, false]);
                        controller.isAdvanced.value = false;
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFFF6F6F6),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Text(
                        "重置",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 26.w),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 88.h,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.applyFilters();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFBDE44),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Text(
                        "确认",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceButton(int min, int max) {
    return OutlinedButton(
      onPressed: () => controller.setPriceRange(min, max),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: controller.minPrice.value == min &&
                  controller.maxPrice.value == max
              ? Colors.amber
              : Colors.grey.shade300,
        ),
        backgroundColor:
            controller.minPrice.value == min && controller.maxPrice.value == max
                ? Colors.amber.shade50
                : Colors.transparent,
      ),
      child: Text(
        "¥$min-¥$max",
        style: TextStyle(
          fontSize: 22.sp,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildRatingButton(double rating) {
    return OutlinedButton(
      onPressed: () => controller.setMinRating(rating),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: controller.minRating.value == rating
              ? Colors.amber
              : Colors.grey.shade300,
        ),
        backgroundColor: controller.minRating.value == rating
            ? Colors.amber.shade50
            : Colors.transparent,
      ),
      child: Text(
        "${rating}分+",
        style: TextStyle(
          fontSize: 22.sp,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSortSection() {
    return Wrap(
      spacing: 20.w,
      runSpacing: 16.h,
      children: [
        _buildSortChip('good_rating', "好评优先"),
        _buildSortChip('recommended', "热门推荐"),
        _buildSortChip('price_asc', "低价优先"),
        _buildSortChip('service', "服务优先"),
        _buildSortChip('nearest', "离我最近"),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Wrap(
      spacing: 20.w,
      runSpacing: 16.h,
      children: [
        _buildCategoryChip('all', "全部"),
        _buildCategoryChip('popular', "受欢迎"),
        _buildCategoryChip('resort', "度假村"),
        _buildCategoryChip('hotel', "酒店"),
        _buildCategoryChip('villa', "度假别墅"),
      ],
    );
  }

  Widget _buildFacilitySection() {
    return Wrap(
      spacing: 20.w,
      runSpacing: 16.h,
      children: [
        _buildFacilityChip(0, "免费WiFi"),
        _buildFacilityChip(1, "免费停车"),
        _buildFacilityChip(2, "游泳池"),
        _buildFacilityChip(3, "大露台"),
        _buildFacilityChip(4, "大床房"),
        _buildFacilityChip(5, "餐厅"),
        _buildFacilityChip(6, "健身房"),
      ],
    );
  }

  Widget _buildSortChip(String type, String text) {
    return Obx(() => GestureDetector(
          onTap: () => controller.setSortType(type),
          child: Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: controller.sortType.value == type
                  ? Color(0xFFFBDE44)
                  : Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: controller.sortType.value == type
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
        ));
  }

  Widget _buildCategoryChip(String type, String text) {
    return Obx(() => GestureDetector(
          onTap: () => controller.setCategoryType(type),
          child: Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: controller.categoryType.value == type
                  ? Color(0xFFFBDE44)
                  : Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: controller.categoryType.value == type
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
        ));
  }

  Widget _buildFacilityChip(int index, String text) {
    if (index >= controller.selectedFacilities.length) {
      return const SizedBox.shrink();
    }
    return Obx(() => GestureDetector(
          onTap: () => controller.toggleFacility(index),
          child: Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: controller.selectedFacilities[index]
                  ? Color(0xFFFBDE44)
                  : Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: controller.selectedFacilities[index]
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
        ));
  }

  Widget _buildSortButton(String type, String text) {
    return Obx(() => OutlinedButton(
          onPressed: () => controller.setSortType(type),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: controller.sortType.value == type
                  ? Colors.amber
                  : Colors.grey.shade300,
            ),
            backgroundColor: controller.sortType.value == type
                ? Colors.amber.shade50
                : Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black87,
            ),
          ),
        ));
  }

  Widget _buildFacilityButton(int index, String text) {
    if (index >= controller.selectedFacilities.length) {
      return const SizedBox.shrink();
    }
    return Obx(() => FilterChip(
          selected: controller.selectedFacilities[index],
          onSelected: (selected) => controller.toggleFacility(index),
          label: Text(text),
          selectedColor: Colors.amber.shade100,
          checkmarkColor: Colors.amber,
          labelStyle: TextStyle(
            color: controller.selectedFacilities[index]
                ? Colors.amber.shade800
                : Colors.grey.shade700,
          ),
          side: BorderSide(
            color: controller.selectedFacilities[index]
                ? Colors.amber.shade300
                : Colors.grey.shade300,
          ),
        ));
  }

  Widget _buildAdvancedButton() {
    return Obx(() => OutlinedButton(
          onPressed: () => controller.toggleAdvanced(),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: controller.isAdvanced.value
                  ? Colors.amber
                  : Colors.grey.shade300,
            ),
            backgroundColor: controller.isAdvanced.value
                ? Colors.amber.shade50
                : Colors.transparent,
          ),
          child: Text(
            "高级最近",
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black87,
            ),
          ),
        ));
  }

  Widget _buildCategoryButton(String type, String text) {
    return Obx(() => OutlinedButton(
          onPressed: () => controller.setCategoryType(type),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: controller.categoryType.value == type
                  ? Colors.amber
                  : Colors.grey.shade300,
            ),
            backgroundColor: controller.categoryType.value == type
                ? Colors.amber.shade50
                : Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black87,
            ),
          ),
        ));
  }

  Widget _buildPriceRangeSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  "¥${controller.minPrice.value}",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                  ),
                )),
            Obx(() => Text(
                  controller.maxPrice.value >= 10000
                      ? "¥10000+"
                      : "¥${controller.maxPrice.value}",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                  ),
                )),
          ],
        ),
        SizedBox(height: 16.h),
        Obx(() => RangeSlider(
              values: RangeValues(
                controller.minPrice.value.toDouble(),
                controller.maxPrice.value.toDouble(),
              ),
              min: 0,
              max: 10000,
              divisions: 100,
              activeColor: Colors.amber,
              inactiveColor: Colors.grey.shade300,
              onChanged: (RangeValues values) {
                controller.minPrice.value = values.start.round();
                controller.maxPrice.value = values.end.round();
              },
            )),
      ],
    );
  }

  Widget _buildHotSearchTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 24.w, 40.w, 10.w),
      child: Row(
        children: [
          Icon(
            Icons.whatshot,
            color: Colors.red,
            size: 36.sp,
          ),
          SizedBox(width: 24.w),
          Text(
            "热门搜索",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1B1B1B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResultTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(24.w, 22.w, 24.w, 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(
                "搜索结果'${controller.searchQuery.value}'",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              )),
          TextButton.icon(
            onPressed: () {
              Get.bottomSheet(_buildFilterBottomSheet());
            },
            icon: Icon(
              Icons.filter_list,
              color: Colors.grey.shade600,
              size: 24.sp,
            ),
            label: Text(
              "筛选",
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard({
    required String imagePath,
    required String name,
    required String rating,
    required String reviews,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.w),
      height: 208.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imagePath,
                width: 200.w,
                height: 160.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200.w,
                    height: 160.w,
                    color: Colors.grey.shade300,
                    child: Icon(
                      Icons.hotel,
                      color: Colors.grey.shade500,
                      size: 60.sp,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 24.w, 24.w, 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "$rating | $reviews",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "¥",
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: Color(0xFF1B1B1B),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: price,
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: Color(0xFF1B1B1B),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "/起",
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: Color(0xFF1B1B1B),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 56.h,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBDE44),
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.navigation,
                              size: 24.sp,
                              color: Color(0xFF1B1B1B),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "导航",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B1B1B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotSearches() {
    return Expanded(
      child: Column(
        children: [
          _buildHotSearchTitle(),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.hotSearches.length,
                  itemBuilder: (context, index) {
                    final hotel = controller.hotSearches[index];
                    return _buildHotelCard(
                      imagePath: hotel.imagePath,
                      name: hotel.name,
                      rating: hotel.rating,
                      reviews: hotel.reviews,
                      price: hotel.price,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: Column(
        children: [
          _buildSearchResultTitle(),
          Expanded(
            child: Obx(() {
              if (controller.filteredHotels.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 120.sp,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        "没有找到\"${controller.searchQuery.value}\"",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "尝试输入另一个相关的关键字",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.filteredHotels.length,
                itemBuilder: (context, index) {
                  final hotel = controller.filteredHotels[index];
                  return _buildHotelCard(
                    imagePath: hotel.imagePath,
                    name: hotel.name,
                    rating: hotel.rating,
                    reviews: hotel.reviews,
                    price: hotel.price,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return Column(
      children: [
        _buildSearchBar(),
        _buildSearchTags(),
        Obx(() => controller.isSearching.value
            ? _buildSearchResults()
            : _buildHotSearches()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HotelSearchController());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
