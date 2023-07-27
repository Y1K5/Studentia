import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:studentia/features/screens/channel_page.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/constants/styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonTitles = [
      'Muslim Community',
      'Hanwoori Dormitory',
      'Language Exchange',
      'Accommodation',
      'Buy and Sell',
      'CSE Channel',
      'Arab Speakers',
      'Muslim Community',
      'Hanwoori Dormitory',
      'Language Exchange',
      'Accommodation',
      'Buy and Sell',
      'CSE Channel',
      'Arab Speakers'
    ];

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double commonSpacer = screenHeight * 0.02;
    final textTheme = Theme.of(context).textTheme;

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
                SizedBox(height: screenHeight * 0.01),
                const Center(
                  child: MainChannels(buttonTitles: [
                    'News',
                    'Everyone',
                    'Discover',
                    'Gigs',
                  ]),
                ),
                SizedBox(height: commonSpacer),
                _buildSectionHeader(context, textTheme, 'Your Channels'),
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
                final title = buttonTitles[index];
                return YourChannels(buttonTitle: title);
              },
              childCount: buttonTitles.length,
            ),
          ),
        ),
      ],
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

class MainChannels extends StatelessWidget {
  final List<String> buttonTitles;

  const MainChannels({required this.buttonTitles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var title in buttonTitles) ...[
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChannelPage(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(ReusableStyles.radius)),
              ),
              side: BorderSide(
                width: screenHeight * 0.0007,
                color: Palette.borderGrayColor,
              ),
            ),
            child: RichText(
              text: TextSpan(
                text: '# ',
                style: TextStyle(
                  color: Palette.pinkColor,
                  fontFamily: 'Lato',
                  fontSize: screenHeight * 0.016,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class YourChannels extends StatelessWidget {
  final String buttonTitle;

  const YourChannels({required this.buttonTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    final EdgeInsetsGeometry buttonPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.05,
      vertical: screenHeight * 0.015,
    );
    const RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(ReusableStyles.radius)),
    );

    Widget buildLabelText(String text) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.011),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChannelPage(),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          padding: buttonPadding,
          shape: buttonShape,
          side: BorderSide(
            width: screenHeight * 0.0007,
            color: Palette.borderLightGrayColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              '# $buttonTitle',
              style: textTheme.bodyLarge,
              gradientType: GradientType.linear,
              colors: ReusableStyles.gradientColors,
            ),
            SizedBox(height: screenHeight * 0.007),
            buildLabelText(
                'Lorem ipsum dolor sit amet, consecuences at the peace'),
            SizedBox(height: screenHeight * 0.007),
            buildLabelText(
                'Lorem ipsum dolor sit amet, consecuences at the house and tell them sorry'),
          ],
        ),
      ),
    );
  }
}
