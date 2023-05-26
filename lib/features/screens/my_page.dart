import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/helpers/theme_manager.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: 'Profile',
        leading: SvgPicture.asset(
          AssetsConstants.leftArrowIcon,
          colorFilter: const ColorFilter.mode(
            Palette.iconBlackColor,
            BlendMode.srcIn,
          ),
          height: 28.0,
        ),
        showLeading: true,
        action: SvgPicture.asset(AssetsConstants.userActive, height: 27.0),
        showActionIcon: true,
        onActionTap: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                ReusableStyles.horizontalPadding,
                MediaQuery.of(context).size.height * 0.02,
                ReusableStyles.horizontalPadding,
                0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My Account',
                        style: ReusableStyles.titleTextStyle),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Customize your experience.',
                      style: ReusableStyles.subtitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ProfileOptions(
                  {
                    'Change Username': () {
                      // Perform the action for 'Change Username'
                    },
                    'Change Email': () {
                      // Perform the action for 'Change Email'
                    },
                    'Change Password': () {
                      // Perform the action for 'Change Password'
                    },
                    'Community Rules': () {
                      // Perform the action for 'Community Rules'
                    },
                    'Privacy & Security': () {
                      // Perform the action for 'Privacy & Security'
                    },
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Text('Preferences', style: ReusableStyles.titleTextStyle),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ProfileOptions(
                  {
                    'Toggle Mode': () {
                      themeManager.toggleTheme();
                    },
                    'Saved': () {
                      // Perform the action for 'Change Email'
                    },
                    'My Likes': () {
                      // Perform the action for 'Change Password'
                    },
                    'My Posts': () {
                      // Perform the action for 'Community Rules'
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07,
                        vertical: MediaQuery.of(context).size.height * 0.015,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ReusableStyles.radius)),
                      ),
                      side: const BorderSide(
                        width: 1.0,
                        color: Palette.deleteRedColor,
                      ),
                    ),
                    child: const Text('Delete my account',
                        style: ReusableStyles.deleteButton),
                  ),
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
                vertical: MediaQuery.of(context).size.height * 0.013),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: ReusableStyles.myPageButtons),
              SvgPicture.asset(
                AssetsConstants.rightArrowIcon,
                colorFilter: const ColorFilter.mode(
                  Palette.iconBlackColor,
                  BlendMode.srcIn,
                ),
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
