import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/presentation/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // card view theme

    // app bar theme

    // Button theme

    // Text theme

    // input decoration theme (text form field)
  );
}
