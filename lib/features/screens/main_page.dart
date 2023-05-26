import 'package:flutter/material.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:studentia/features/screens/channel_page.dart';
import 'package:studentia/theme/palette.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const SearchBar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const MainChannels(['Notice', 'Everyone', 'Events', 'Promos']),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Your Channels',
            textAlign: TextAlign.left,
            style: ReusableStyles.titleTextStyle,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const YourChannels(
          [
            'Muslim Community',
            'Hanwoori Dormitory',
            'Language Exchange',
            'Accomodation',
            'Buy and Sell',
            'CSE Channel',
            'Arab Speakers'
          ],
        ),
      ],
    );
  }
}

class MainChannels extends StatelessWidget {
  final List<String> buttonTitles;

  const MainChannels(this.buttonTitles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buttonTitles.map((title) {
        return OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChannelPage(),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            side: const BorderSide(
              width: 1.0,
              color: Palette.borderGrayColor,
            ),
          ),
          child: RichText(
            text: TextSpan(
              text: '# ',
              style: const TextStyle(
                color: Palette.pinkColor,
                fontFamily: 'Lato',
                fontSize: 13.0,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Palette.iconBlackColor,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class YourChannels extends StatelessWidget {
  final List<String> buttonTitles;

  const YourChannels(this.buttonTitles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry buttonPadding = EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.width * 0.04);
    const RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(ReusableStyles.radius)),
    );

    Widget buildLabelText(String text) {
      return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: ReusableStyles.channelPostsTextStyle,
            overflow: TextOverflow.ellipsis,
          ));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttonTitles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final title = buttonTitles[index];
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: buttonPadding,
            shape: buttonShape,
            side: const BorderSide(
              width: 1.0,
              color: Palette.borderGrayColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                '# $title',
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700),
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
              const SizedBox(height: 7.0),
              buildLabelText(
                  'Lorem ipsum dolor sit amet, consecuences at the peace'),
              const SizedBox(height: 7.0),
              buildLabelText(
                  'Lorem ipsum dolor sit amet, consecuences at the house and tell them sorry'),
            ],
          ),
        );
      },
    );
  }
}
