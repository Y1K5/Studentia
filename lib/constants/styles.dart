import 'package:flutter/material.dart';
import 'package:studentia/theme/palette.dart';

class ReusableStyles {
  static const radius = 20.0;
  static const sqRadius = 15.0;
  static const horizontalPadding = 0.05;
  static const toolBarBorder = Palette.borderLightGrayColor;

  static const gradientColors = [
    Palette.pinkColor,
    Palette.blueColor,
    Palette.purpleColor
  ];

  static const TextStyle appGradientTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 19.0,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
  );

  static const TextStyle deleteButton = TextStyle(
    fontFamily: 'Lato',
    color: Palette.deleteRedColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle userTimeText = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
}
