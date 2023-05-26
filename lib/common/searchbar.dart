import 'package:flutter/material.dart';
import 'package:studentia/constants/styles.dart';
import '../theme/palette.dart';
import 'package:studentia/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.09,
      child: TextField(
          decoration: InputDecoration(
            filled: true,
            //fillColor: Palette.searchBarInputAreaColor,
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: 0),
            suffixIcon: SvgPicture.asset(AssetsConstants.searchIcon,
                colorFilter: const ColorFilter.mode(
                    Palette.iconBlackColor, BlendMode.srcIn),
                fit: BoxFit.scaleDown),
          ),
          style: ReusableStyles.channelPostsTextStyle),
    );
  }
}
