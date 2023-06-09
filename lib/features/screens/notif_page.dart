import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/helpers/gradient_button.dart';
import './write_post.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.0),
      itemBuilder: (context, index) {

        final username = postUsername[index];
        final time = postTime[index];

        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.height * 0.018),
            side: const BorderSide(
              width: 0.3,
              color: Palette.borderLightGrayColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  UnicornOutlineButton(
                    strokeWidth: 1,
                    radius: ReusableStyles.radius,
                    width: 0.1,
                    height: 0.045,
                    gradient: LinearGradient(colors: ReusableStyles.gradientColors),
                    child: 
                      GradientText(
                        '',
                        style: ReusableStyles.myPageButtons,
                        gradientType: GradientType.linear,
                        colors: ReusableStyles.gradientColors,
                      ),
                    onPressed: () {
                    },
                  ),
                ]
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Expanded( // Wrap the text content in an Expanded widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Board:', style: ReusableStyles.userTimeText.copyWith(color: Palette.iconBlackColor)),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                        Text('new comment', style: ReusableStyles.userTimeText.copyWith(color: Palette.iconBlackColor, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                    Text(
                      'Lorem ipsum dolor saquima cosectetur asifnfn...',
                      style: ReusableStyles.postText,
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
