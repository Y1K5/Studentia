import 'package:flutter/material.dart';
import 'package:studentia/theme/palette.dart';

class ReusableStyles {
  static const radius = 20.0;
  static const horizontalPadding = 25.0;
  static const toolBarBorder = Palette.borderLightGrayColor;

  static const gradientColors = [
    Palette.pinkColor,
    Palette.blueColor,
    Palette.purpleColor
  ];

  static const TextStyle appGradientTitle = TextStyle(
    fontSize: 19.0,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: Palette.iconBlackColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
    fontSize: 16.0,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: Palette.subtitleBlackColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
  );

  static const TextStyle channelPostsTextStyle = TextStyle(
    color: Palette.iconBlackColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  static const TextStyle deleteButton = TextStyle(
    color: Palette.deleteRedColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle myPageButtons = TextStyle(
    color: Palette.iconBlackColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static const TextStyle userTimeText = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  static const TextStyle postText = TextStyle(
    color: Palette.iconBlackColor,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}