import 'dart:ui';

class HexColor extends Color {
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Add alpha if not provided
    }
    return int.parse(hexColor, radix: 16);
  }
}
