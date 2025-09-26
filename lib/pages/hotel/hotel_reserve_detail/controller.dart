import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod {
  final int id;
  final PaymentType type;
  final String cardNumber;
  final String logoPath;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.cardNumber,
    required this.logoPath,
  });

  String getDisplayName() {
    switch (type) {
      case PaymentType.visa:
        return "Visa";
      case PaymentType.mastercard:
        return "Master Card";
      case PaymentType.amex:
        return "American Express";
    }
  }

  Color getBackgroundColor() {
    switch (type) {
      case PaymentType.visa:
        return const Color(0xFF1A1F71);
      case PaymentType.mastercard:
        return const Color(0xFFEB001B);
      case PaymentType.amex:
        return const Color(0xFF006FCF);
    }
  }
}

enum PaymentType { visa, mastercard, amex }

class PaymentMethodBottomSheet extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  final int selectedIndex;
  final Function(int) onPaymentMethodSelected;
  final VoidCallback onAddCard;
  final VoidCallback onPay;

  const PaymentMethodBottomSheet({
    super.key,
    required this.paymentMethods,
    required this.selectedIndex,
    required this.onPaymentMethodSelected,
    required this.onAddCard,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle indicator
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            // Title with close button
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "选择付款方式",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Payment methods list
            ...paymentMethods.asMap().entries.map((entry) {
              final index = entry.key;
              final method = entry.value;
              return _buildPaymentMethodItem(
                method,
                index == selectedIndex,
                () => onPaymentMethodSelected(index),
              );
            }),
            const SizedBox(height: 24),
            // Bottom buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onAddCard,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "添加卡片",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "支付",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem(
    PaymentMethod method,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF007AFF) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Card logo
            Container(
              width: 48,
              height: 32,
              decoration: BoxDecoration(
                color: method.getBackgroundColor(),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  method
                      .getDisplayName()
                      .substring(0, method.type == PaymentType.amex ? 4 : 4),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Card info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.getDisplayName(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    method.cardNumber,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Selection indicator
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected ? const Color(0xFF007AFF) : Colors.grey[400]!,
                  width: 2,
                ),
                color:
                    isSelected ? const Color(0xFF007AFF) : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class HotelReserveDetailController extends GetxController {
  HotelReserveDetailController();

  // 支付方式数据
  var selectedPaymentMethodIndex = 0.obs;
  var paymentMethods = <PaymentMethod>[
    PaymentMethod(
      id: 1,
      type: PaymentType.visa,
      cardNumber: "3463 **** **** 9812",
      logoPath: "assets/images/visa_logo.png",
    ),
    PaymentMethod(
      id: 2,
      type: PaymentType.mastercard,
      cardNumber: "8622 **** **** 5632",
      logoPath: "assets/images/mastercard_logo.png",
    ),
    PaymentMethod(
      id: 3,
      type: PaymentType.amex,
      cardNumber: "2004 **** **** 6332",
      logoPath: "assets/images/amex_logo.png",
    ),
  ].obs;

  // 预订信息
  var bookingInfo = Rxn<Map<String, dynamic>>();
  var checkInDate = "2月18日".obs;
  var checkOutDate = "2月24日".obs;
  var nights = 1.obs;
  var roomCount = 4.obs;
  var guestCount = 1.obs;
  var contactPhone = "".obs;

  // 价格信息
  var originalPrice = 1899.obs;
  var discount = 219.obs;
  var finalPrice = 1899.obs;

  // 酒店和房间信息
  var hotelName = "私人游泳池-豪华大床房".obs;
  var hotelSpecs = "1张1.8米大床  2人入住  80m²".obs;
  var hotelImage = "https://picsum.photos/300/200?random=10".obs;

  // 入住和离店时间
  var checkInTime = "14:00以后".obs;
  var checkOutTime = "12:00以前".obs;

  // 取消政策
  var cancelPolicy = "今天12点前可免费取消".obs;

  // 促销优惠信息
  var promotionDiscount = "优惠减免 -¥219".obs;

  _initData() {
    // 可以从路由参数获取预订信息
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      bookingInfo.value = args;
      // 根据传入的数据更新相关信息
      updateBookingDetails(args);
    }
    update(["hotel_reserve_detail"]);
  }

  void updateBookingDetails(Map<String, dynamic> data) {
    if (data.containsKey('room')) {
      final room = data['room'] as Map<String, dynamic>;
      hotelName.value = room['name'] ?? hotelName.value;
      hotelSpecs.value =
          "${room['size']}  ${room['capacity']}  ${room['area']}";
      hotelImage.value = room['image'] ?? hotelImage.value;
      originalPrice.value = int.tryParse(room['price']) ?? originalPrice.value;
    }

    if (data.containsKey('checkInDate')) {
      checkInDate.value = data['checkInDate'];
    }
    if (data.containsKey('checkOutDate')) {
      checkOutDate.value = data['checkOutDate'];
    }
    if (data.containsKey('roomCount')) {
      roomCount.value = data['roomCount'];
    }
    if (data.containsKey('guestCount')) {
      guestCount.value = data['guestCount'];
    }

    calculateFinalPrice();
  }

  void calculateFinalPrice() {
    finalPrice.value = originalPrice.value - discount.value;
  }

  void onPhoneChanged(String phone) {
    contactPhone.value = phone;
  }

  void onConfirmPayment() {
    _showPaymentMethodSheet();
  }

  void _showPaymentMethodSheet() {
    Get.bottomSheet(
      PaymentMethodBottomSheet(
        paymentMethods: paymentMethods,
        selectedIndex: selectedPaymentMethodIndex.value,
        onPaymentMethodSelected: (index) {
          selectedPaymentMethodIndex.value = index;
        },
        onAddCard: () {
          // 添加新卡片逻辑
          Get.snackbar("提示", "添加新卡片功能");
        },
        onPay: () {
          Get.back();
          Get.snackbar("支付成功",
              "使用${paymentMethods[selectedPaymentMethodIndex.value].getDisplayName()}支付成功");
        },
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  void onPaymentMethodChanged(int index) {
    selectedPaymentMethodIndex.value = index;
  }

  void onModifyTime() {
    // 修改时间逻辑
  }

  void onViewOrderDetails() {
    // 查看订房必读逻辑
  }

  void onPromotionDetails() {
    // 查看促销优惠详情
  }

  void onInvoiceDetails() {
    // 发票详情逻辑
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
