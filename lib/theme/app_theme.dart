import 'package:flutter/material.dart';
import 'package:studentia/theme/palette.dart';

class AppTheme {
  static TextStyle getStyle(bool isDarkTheme, BuildContext context,
      double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Lato',
      color:
          isDarkTheme ? Palette.lightBackgroundColor : Palette.iconBlackColor,
      fontSize: MediaQuery.of(context).size.height * fontSize,
      fontWeight: fontWeight,
    );
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    ThemeData baseTheme = isDarkTheme ? ThemeData.dark() : ThemeData.light();

    return baseTheme.copyWith(
      textTheme: TextTheme(
        headlineLarge: getStyle(
            isDarkTheme, context, 0.035, FontWeight.w900), // start page title
        headlineMedium: getStyle(isDarkTheme, context, 0.033,
            FontWeight.w900), // login/signup page title
        titleLarge: getStyle(
            isDarkTheme, context, 0.024, FontWeight.w900), // tool bar title
        titleMedium: getStyle(isDarkTheme, context, 0.016, FontWeight.w900),
        titleSmall: getStyle(isDarkTheme, context, 0.016,
            FontWeight.w900), // Create Channel Button, Board Name Notif
        bodyMedium:
            getStyle(isDarkTheme, context, 0.016, FontWeight.w400).copyWith(
          color: isDarkTheme ? Palette.iconWhiteColor : Palette.iconBlackColor,
        ), // Main page lorem ipsum
        bodyLarge: getStyle(
            isDarkTheme, context, 0.016, FontWeight.w600), // List Page Buttons
        bodySmall: getStyle(isDarkTheme, context, 0.016,
            FontWeight.normal), // new comment notif
        labelSmall: getStyle(isDarkTheme, context, 0.014, FontWeight.w900),
        labelMedium: getStyle(isDarkTheme, context, 0.02, FontWeight.w900),
        // Start Page Buttons, Your Channels, General, Others
      ),
      scaffoldBackgroundColor: isDarkTheme
          ? Palette.darkBackgroundColor
          : Palette.lightBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme
            ? Palette.darkBackgroundColor
            : Palette.lightBackgroundColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkTheme
            ? Palette.darkBackgroundColor
            : Palette.lightBackgroundColor,
        unselectedItemColor:
            isDarkTheme ? Palette.lightBackgroundColor : Palette.iconBlackColor,
      ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Palette.iconWhiteColor : Palette.iconBlackColor,
        size: MediaQuery.of(context).size.height * 0.02,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: isDarkTheme
            ? Palette.darkSearchBarInputArea
            : Palette.searchBarInputAreaColor,
        suffixIconColor:
            isDarkTheme ? Palette.lightBackgroundColor : Palette.iconBlackColor,
      ),
    );
  }
}
