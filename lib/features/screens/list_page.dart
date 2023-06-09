import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/features/screens/create_channel.dart';
import 'package:studentia/helpers/gradient_button.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const SearchBarWidget(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        UnicornOutlineButton(
          strokeWidth: 1,
          radius: ReusableStyles.radius,
          width: 0.9,
          height: 0.05,
          gradient: LinearGradient(colors: ReusableStyles.gradientColors),
          child: 
            GradientText(
              'Create Channel',
              style: ReusableStyles.myPageButtons,
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
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ProfileOptions(
          {
            'Everyone': () {
              
            },
            'Notice': () {
              // Perform the action for 'Change Email'
            },
            'Events': () {
              // Perform the action for 'Change Password'
            },
            'Promotions': () {
              // Perform the action for 'Community Rules'
            }
          },
        ),
      ],
    );
  }
}


class ProfileOptions extends StatelessWidget {
  final Map<String, VoidCallback> buttonActions;

  const ProfileOptions(this.buttonActions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttonActions.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
      itemBuilder: (context, index) {
        final title = buttonActions.keys.elementAt(index);
        final action = buttonActions.values.elementAt(index);
        return OutlinedButton(
          onPressed: action,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.014),
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(ReusableStyles.radius)),
            ),
            side: const BorderSide(
              width: 0.7,
              color: Palette.iconBlackColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GradientText(
                '#',
                style: ReusableStyles.myPageButtons.copyWith(fontWeight: FontWeight.w400, fontSize: 18.0),
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Text(title, style: ReusableStyles.myPageButtons),
            ],
          ),
        );
      },
    );
  }
}

