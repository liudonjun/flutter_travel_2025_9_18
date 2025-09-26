import 'package:get/get.dart';

class Hotel {
  final String imagePath;
  final String name;
  final String rating;
  final String reviews;
  final String price;
  final double ratingValue;
  final int priceValue;

  Hotel({
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.ratingValue,
    required this.priceValue,
  });
}

class HotelSearchController extends GetxController {
  HotelSearchController();

  // 搜索状态
  RxBool isSearching = false.obs;
  RxString searchQuery = ''.obs;

  // 热门搜索数据
  RxList<Hotel> hotSearches = <Hotel>[].obs;

  // 筛选状态
  RxInt minPrice = 0.obs;
  RxInt maxPrice = 10000.obs;
  RxDouble minRating = 0.0.obs;
  RxString sortType = 'recommended'.obs; // good_rating, recommended, price_asc, service
  RxString categoryType = 'all'.obs; // all, popular, resort, hotel, villa
  RxBool isAdvanced = false.obs;
  RxList<bool> selectedFacilities = [false, false, false, false, false, false, false].obs; // WiFi、停车、游泳池、大露台、大床房、餐厅、健身房

  // 酒店数据
  RxList<Hotel> hotels = <Hotel>[].obs;
  RxList<Hotel> filteredHotels = <Hotel>[].obs;

  _initData() {
    // 初始化热门搜索数据
    hotSearches.assignAll([
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=1",
        name: "兰卡威彩虹度假酒店",
        rating: "4.5分",
        reviews: "126人评价",
        price: "1899",
        ratingValue: 4.5,
        priceValue: 1899,
      ),
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=2",
        name: "巴厘岛普尔曼乐古安",
        rating: "4.9分",
        reviews: "2.3万人评价",
        price: "682",
        ratingValue: 4.9,
        priceValue: 682,
      ),
    ]);

    // 初始化酒店数据
    hotels.assignAll([
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=1",
        name: "兰卡威彩虹度假酒店",
        rating: "4.5分",
        reviews: "126人评价",
        price: "1899",
        ratingValue: 4.5,
        priceValue: 1899,
      ),
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=2",
        name: "巴厘岛普尔曼乐古安",
        rating: "4.9分",
        reviews: "2.3万人评价",
        price: "682",
        ratingValue: 4.9,
        priceValue: 682,
      ),
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=3",
        name: "塞班亚克·努萨·佩尼达",
        rating: "4.8分",
        reviews: "8644人评价",
        price: "299",
        ratingValue: 4.8,
        priceValue: 299,
      ),
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=4",
        name: "罗得地",
        rating: "4.8分",
        reviews: "1.2万人评价",
        price: "899",
        ratingValue: 4.8,
        priceValue: 899,
      ),
      Hotel(
        imagePath: "https://picsum.photos/200/200?random=5",
        name: "七塔度假村",
        rating: "4.7分",
        reviews: "289人评价",
        price: "199",
        ratingValue: 4.7,
        priceValue: 199,
      ),
    ]);

    applyFilters();
    update(["hotel_search"]);
  }

  // 应用筛选条件
  void applyFilters() {
    filteredHotels.assignAll(hotels.where((hotel) {
      // 价格筛选
      bool priceMatch = hotel.priceValue >= minPrice.value && hotel.priceValue <= maxPrice.value;
      // 评分筛选
      bool ratingMatch = hotel.ratingValue >= minRating.value;
      // 搜索关键词筛选
      bool searchMatch = searchQuery.isEmpty || hotel.name.contains(searchQuery.value);
      // 设施筛选 (这里简化处理，实际项目中应该有更复杂的逻辑)
      bool facilityMatch = selectedFacilities.every((f) => !f) || true; // 暂时不实现具体的设施筛选逻辑

      return priceMatch && ratingMatch && searchMatch && facilityMatch;
    }).toList());

    // 排序
    sortHotels();
  }

  // 排序酒店
  void sortHotels() {
    switch (sortType.value) {
      case 'price_asc':
        filteredHotels.sort((a, b) => a.priceValue.compareTo(b.priceValue));
        break;
      case 'good_rating':
        filteredHotels.sort((a, b) => b.ratingValue.compareTo(a.ratingValue));
        break;
      case 'service':
        // 服务优先排序逻辑
        filteredHotels.sort((a, b) => b.ratingValue.compareTo(a.ratingValue));
        break;
      case 'recommended':
      default:
        // 默认排序（推荐排序）
        break;
    }
  }

  // 设置筛选条件
  void setPriceRange(int min, int max) {
    minPrice.value = min;
    maxPrice.value = max;
    applyFilters();
  }

  void setMinRating(double rating) {
    minRating.value = rating;
    applyFilters();
  }

  void toggleFacility(int index) {
    selectedFacilities[index] = !selectedFacilities[index];
    applyFilters();
  }

  void setSortType(String type) {
    sortType.value = type;
    applyFilters();
  }

  void setCategoryType(String type) {
    categoryType.value = type;
    applyFilters();
  }

  void toggleAdvanced() {
    isAdvanced.value = !isAdvanced.value;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  // 开始搜索
  void startSearch() {
    isSearching.value = true;
    applyFilters();
  }

  // 取消搜索，回到热门搜索状态
  void cancelSearch() {
    isSearching.value = false;
    searchQuery.value = '';
    // 重置筛选条件
    minPrice.value = 0;
    maxPrice.value = 10000;
    minRating.value = 0.0;
    selectedFacilities.assignAll([false, false, false, false, false, false, false]);
    sortType.value = 'recommended';
    categoryType.value = 'all';
    isAdvanced.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
