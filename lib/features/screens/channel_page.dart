import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/features/screens/write_post.dart';

class PostData {
  final String postUsername;
  final String postContent;
  final int postTime;
  final int postLikes;
  final int postReplies;

  PostData({
    required this.postUsername,
    required this.postContent,
    required this.postTime,
    required this.postLikes,
    required this.postReplies,
  });
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final commonHSpacer = screenHeight * 0.02;
    final theme = Theme.of(context);

    var posts = [
      PostData(
          postUsername: 'anonymous',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'chaewonsoo',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'adordme',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'niallhoran',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'anonymous',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'anonymous',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'livmoore',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
      PostData(
          postUsername: 'anonymous',
          postContent:
              'Lorem ipsum dolor saquimari tanitus cosectetur adispiscing elit, sed do eismod tempos indidicunt ut labore.',
          postTime: 4,
          postLikes: 32,
          postReplies: 15),
    ];

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
          title: 'Channel Name',
          leading: SvgPicture.asset(
            AssetsConstants.leftArrowIcon,
            colorFilter: ColorFilter.mode(
              theme.iconTheme.color ?? Palette.iconBlackColor,
              BlendMode.srcIn,
            ),
            height: screenHeight * 0.032,
          ),
          showLeading: true,
          action: SvgPicture.asset(AssetsConstants.featherIcon,
              height: screenHeight * 0.034),
          showActionIcon: true,
          onActionTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WritePostPage(),
              ),
            );
          }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ReusableStyles.horizontalPadding),
          child: ListView.builder(
            itemCount: posts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(children: [
                  SizedBox(height: commonHSpacer),
                  const SearchBarWidget(),
                  SizedBox(height: commonHSpacer),
                ]);
              } else {
                final post = posts[index - 1];
                return ChannelPost(
                  postUsername: post.postUsername,
                  postContent: post.postContent,
                  postTime: post.postTime,
                  postLikes: post.postLikes,
                  postReplies: post.postReplies,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ChannelPost extends StatelessWidget {
  final String postUsername;
  final String postContent;
  final int postTime;
  final int postLikes;
  final int postReplies;

  const ChannelPost({
    required this.postUsername,
    required this.postContent,
    required this.postTime,
    required this.postLikes,
    required this.postReplies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double commonHSpacer = screenHeight * 0.0007;
    final double commonWSpacer = screenHeight * 0.02;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.007),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.01),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(ReusableStyles.radius)),
              ),
              side: BorderSide(
                width: commonHSpacer,
                color: Palette.borderLightGrayColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('@$postUsername', style: textTheme.bodyLarge),
                    SizedBox(width: commonWSpacer),
                    Text('$postTime' 'h ago',
                        style: ReusableStyles.userTimeText
                            .copyWith(color: Palette.borderLightGrayColor)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(postContent, style: textTheme.bodyMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetsConstants.heartIcon,
                        colorFilter: const ColorFilter.mode(
                            Palette.deleteRedColor, BlendMode.srcIn),
                        height: screenHeight * 0.017),
                    SizedBox(width: screenWidth * 0.01),
                    Text('$postLikes', style: textTheme.labelSmall),
                    SizedBox(width: commonWSpacer),
                    SvgPicture.asset(AssetsConstants.replyIcon,
                        colorFilter: const ColorFilter.mode(
                            Palette.blueColor, BlendMode.srcIn),
                        height: screenHeight * 0.017),
                    SizedBox(width: screenWidth * 0.01),
                    Text('$postReplies', style: textTheme.labelSmall),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
