import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHexColor("#ED9728");
  static Color darkGrey = HexColor.fromHexColor("#525252");
  static Color grey = HexColor.fromHexColor("#737477");
  static Color lightGrey = HexColor.fromHexColor("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHexColor("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHexColor("#d17d11");
  static Color grey1 = HexColor.fromHexColor("#707070");
  static Color grey2 = HexColor.fromHexColor("#797979");
  static Color white = HexColor.fromHexColor("#FFFFFF");
  static Color error = HexColor.fromHexColor("#e61f34"); // red color


}

extension HexColor on Color {
  static Color fromHexColor(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
