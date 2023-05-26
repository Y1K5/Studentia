import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: 'Channel Name',
        leading: SvgPicture.asset(
          AssetsConstants.leftArrowIcon,
          colorFilter: const ColorFilter.mode(
            Palette.iconBlackColor,
            BlendMode.srcIn,
          ),
          height: 28.0,
        ),
        showLeading: true,
        action: SvgPicture.asset(AssetsConstants.featherIcon, height: 27.0),
        showActionIcon: true,
        onActionTap: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const SearchBar(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const ProfileOptions(
                      [
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                      ],
                      ['7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  final List<String> postUsername;
  final List<String> postTime;
  //final List<String> postContent;
  //final List<String> postLikeNo;
  //final List<String> postReplyNo;

  const ProfileOptions(this.postUsername, this.postTime, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postUsername.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      itemBuilder: (context, index) {
        final username = postUsername[index];
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.015),
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(ReusableStyles.radius)),
            ),
            side: const BorderSide(
              width: 0.7,
              color: Palette.borderLightGrayColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@ $username', style: ReusableStyles.usernameText),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              const Text(
                  'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eiusmod tempor indidicunt ut labore.',
                  style: ReusableStyles.postText),
            ],
          ),
        );
      },
    );
  }
}
