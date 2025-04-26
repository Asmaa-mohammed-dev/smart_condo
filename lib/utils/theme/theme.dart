import 'package:flutter/material.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/theme/custom_themes/appbar_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/chip_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/text_field_theme.dart';
import 'package:smart_condo/utils/theme/custom_themes/text_theme.dart';

class NAppTheme {
  NAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Adobe',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: NTextTheme.lightTextTheme,
    chipTheme: NChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppbBarTheme,
    checkboxTheme: NCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: NColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: NTextTheme.darkTextTheme,
    chipTheme: NChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppbBarTheme,
    checkboxTheme: NCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
      ),
    ),
  );
}
