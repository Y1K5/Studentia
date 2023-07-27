import 'package:flutter/material.dart';
import '../theme/palette.dart';
import 'package:studentia/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.09,
      child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
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
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
