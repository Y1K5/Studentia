import 'package:flutter/material.dart';
import 'package:studentia/theme/palette.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    ThemeData theme = ThemeData.dark().copyWith(
      textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Lato')),
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
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: isDarkTheme
            ? Palette.darkSearchBarInputArea
            : Palette.searchBarInputAreaColor,
        suffixIconColor:
            isDarkTheme ? Palette.iconWhiteColor : Palette.iconBlackColor,
      ),
    );
    return theme;
  }
}
