import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/features/screens/create_channel.dart';
import 'package:studentia/helpers/gradient_button.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double commonSpacer = screenHeight * 0.02;
    final textTheme = Theme.of(context).textTheme;

    var mainChannels = {
      'News': () {},
      'Everyone': () {},
      'Discover': () {},
      'Gigs': () {},
    };

    var otherChannels = {
      'Name of Board 1': () {},
      'Name of Board 2': () {},
      'Name of Board 3': () {},
      'Name of Board 4': () {},
      'Name of Board 5': () {},
      'Name of Board 6': () {},
    };

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ReusableStyles.horizontalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: commonSpacer),
                const SearchBarWidget(),
                SizedBox(height: commonSpacer),
                _buildCreateChannelButton(
                    context, textTheme, screenHeight, screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildSectionHeader(context, textTheme, 'General'),
                SizedBox(height: commonSpacer),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ReusableStyles.horizontalPadding),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final title = mainChannels.keys.elementAt(index);
                final action = mainChannels.values.elementAt(index);
                return ChannelBox(buttonTitle: title, buttonAction: action);
              },
              childCount: mainChannels.length,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ReusableStyles.horizontalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: screenHeight * 0.03),
                _buildSectionHeader(context, textTheme, 'Other'),
                SizedBox(height: commonSpacer),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ReusableStyles.horizontalPadding),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final title = otherChannels.keys.elementAt(index);
                final action = otherChannels.values.elementAt(index);
                return ChannelBox(buttonTitle: title, buttonAction: action);
              },
              childCount: otherChannels.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateChannelButton(BuildContext context, textTheme,
      double screenHeight, double screenWidth) {
    return UnicornOutlineButton(
      strokeWidth: 1,
      radius: ReusableStyles.radius,
      width: screenWidth * 0.009,
      height: screenHeight * 0.000062,
      gradient: const LinearGradient(colors: ReusableStyles.gradientColors),
      child: GradientText(
        'Create Channel',
        style: textTheme.titleSmall,
        gradientType: GradientType.linear,
        colors: ReusableStyles.gradientColors,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateChannelPage(),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, textTheme, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: textTheme.labelMedium,
      ),
    );
  }
}

class ChannelBox extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback buttonAction;

  const ChannelBox(
      {required this.buttonTitle, required this.buttonAction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        OutlinedButton(
          onPressed: buttonAction,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.015,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(ReusableStyles.radius),
              ),
            ),
            side: BorderSide(
              width: screenHeight * 0.0007,
              color: Palette.borderGrayColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GradientText(
                '#',
                style: textTheme.titleMedium,
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Text(buttonTitle, style: textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
