import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/features/screens/write_post.dart';

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
        onActionTap: () { 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WritePostPage(),
            ),
          );
        }
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
                    const SearchBarWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const ProfileOptions(
                      [
                        'anonymous',
                        'chaewonsoo',
                        'adordme',
                        'niallhoran',
                        'anonymous',
                        'anonymous',
                        'anonymous',
                        'illusionflu',
                        'anonymous',
                        'anonymous',
                        'livmoore',
                      ],
                      ['0', '1', '1', '2', '3', '4', '5', '7', '9', '17', '22'],
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
        final time = postTime[index];

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
              Row(
                children: [                                   
                  Text('@$username', style: ReusableStyles.userTimeText.copyWith(color: Palette.iconBlackColor)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text('$time'+'h ago', style: ReusableStyles.userTimeText.copyWith(color: Palette.borderLightGrayColor)),
                ]
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              const Text(
                  'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eiusmod tempor indidicunt ut labore. Aspiri baraci!',
                  style: ReusableStyles.postText),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsConstants.heartIcon, height: 13.0, color: Palette.deleteRedColor),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Text('32', style: ReusableStyles.userTimeText.copyWith(color: Palette.iconBlackColor)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  SvgPicture.asset(AssetsConstants.replyIcon, height: 13.0, color: Palette.blueColor),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Text('15', style: ReusableStyles.userTimeText.copyWith(color: Palette.iconBlackColor))
                ]
              )
            ],
          ),
        );
      },
    );
  }
}
