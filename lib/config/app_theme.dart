import 'package:flutter/material.dart';
import '../core/utils/constants.dart';
import '../core/utils/sizes.dart';
import 'app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primaryColor: AppColorsLight.primaryColor,
    scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColorsLight.appBarBackgroundColor),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        fontFamily: Constants.fontFamily,
        color: AppColorsLight.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        fontFamily: Constants.fontFamily,
        color: AppColorsLight.black,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontFamily: Constants.fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: AppColorsLight.black,
      ),
      titleSmall: TextStyle(
        fontFamily: Constants.fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColorsLight.black,
      ),
      headlineMedium: TextStyle(
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
      labelLarge: TextStyle(
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: AppColorsLight.textLightDefault, //<-- SEE HERE
    // ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.borderRadius),
          topRight: Radius.circular(Sizes.borderRadius),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColorsLight.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsLight.primaryColor,
        disabledBackgroundColor: AppColorsLight.gray,
        disabledForegroundColor: AppColorsLight.gray,
        minimumSize: const Size(50, 48),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(12),
      hintStyle: const TextStyle(
        color: AppColorsLight.textFieldHint,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: AppColorsLight.textFieldHint,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      activeIndicatorBorder: const BorderSide(color: AppColorsLight.primaryColor),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
        borderSide: const BorderSide(width: 1, color: AppColorsLight.borderDanger),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
        borderSide: const BorderSide(width: 1, color: AppColorsLight.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
        borderSide: const BorderSide(width: 1, color: AppColorsLight.deepGray),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
        borderSide: const BorderSide(width: 1, color: AppColorsLight.deepGray),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
        borderSide: const BorderSide(width: 1, color: AppColorsLight.borderDisable),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: AppColorsLight.onPrimaryColor,
          fontFamily: Constants.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: AppColorsLight.primaryColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.borderRadius)),
        elevation: 0,
      ),
    ),
    chipTheme: ChipThemeData(
      secondaryLabelStyle: const TextStyle(
        color: AppColorsLight.onPrimaryColor,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        color: AppColorsLight.black,
        fontFamily: Constants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      selectedShadowColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,

      secondarySelectedColor: AppColorsLight.primaryColor,
      selectedColor: AppColorsLight.primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorsLight.primaryColor,
      foregroundColor: AppColorsLight.onPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorsLight.black,
      contentTextStyle: TextStyle(
        fontFamily: Constants.fontFamily,
        color: AppColorsLight.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: AppColorsLight.backgroundColor,
    //   indicatorColor: AppColorsLight.lightBlue,
    //   labelTextStyle: MaterialStateProperty.resolveWith(
    //     ((states) => getBottomSheetItemStateColor(states)),
    //   ),
    // ),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: Colors.grey,
    //     disabledBackgroundColor: AppColorsLight.surfaceDisabled,
    //     disabledForegroundColor: AppColorsLight.surfaceDisabled,
    //     minimumSize: const Size(50, 48),
    //     elevation: 0,
    //   ),
    // ),
  );
}
