import 'package:flutter/material.dart';
import 'package:smart_condo/utils/constants/colors.dart';

class NChipTheme {
  NChipTheme._();

  ///Light Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

  ///Dark Theme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: NColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
