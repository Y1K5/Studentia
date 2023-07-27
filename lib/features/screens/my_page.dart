import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/helpers/theme_manager.dart';
import 'package:studentia/helpers/confirmation_dialog.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  bool _confirmationDialogVisible = false;

  void _showConfirmationDialog(BuildContext context) {
    setState(() {
      _confirmationDialogVisible = true;
      print(_confirmationDialogVisible);
    });
  }

  void _hideConfirmationDialog(BuildContext context) {
    setState(() {
      _confirmationDialogVisible = false;
      print(_confirmationDialogVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final commonHSpacer = screenHeight * 0.01;
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final themeManager = Provider.of<ThemeManager>(context);

    return Stack(
      children: [
        AbsorbPointer(
          absorbing: _confirmationDialogVisible,
          child: Scaffold(
            extendBodyBehindAppBar: false,
            appBar: ToolBar(
              title: 'Profile',
              leading: SvgPicture.asset(
                AssetsConstants.leftArrowIcon,
                colorFilter: ColorFilter.mode(
                  theme.iconTheme.color ?? Palette.iconBlackColor,
                  BlendMode.srcIn,
                ),
                height: screenHeight * 0.032,
              ),
              showLeading: true,
              action: SvgPicture.asset(AssetsConstants.userActive,
                  height: screenHeight * 0.032),
              showActionIcon: true,
              onActionTap: null,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * ReusableStyles.horizontalPadding,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Account', style: textTheme.labelMedium),
                      SizedBox(height: screenHeight * 0.01),
                      const Text(
                        'Customize your experience.',
                        style: ReusableStyles.subtitleTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: commonHSpacer),
                  ProfileOptions({
                    'Change Username': () {},
                    'Change Email': () {},
                    'Change Password': () {},
                    'Community Rules': () {},
                    'Privacy & Security': () {},
                  }),
                  SizedBox(height: commonHSpacer),
                  Text('Preferences', style: textTheme.labelMedium),
                  SizedBox(height: commonHSpacer),
                  ProfileOptions({
                    'Toggle Mode': () {
                      themeManager.toggleTheme();
                    },
                    'Saved': () {},
                    'My Likes': () {},
                    'My Posts': () {}
                  }),
                  SizedBox(height: commonHSpacer),
                  Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      onPressed: () {
                        _showConfirmationDialog(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.07,
                          vertical: screenHeight * 0.015,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ReusableStyles.radius)),
                        ),
                        side: BorderSide(
                          width: screenHeight * 0.0007,
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
        if (_confirmationDialogVisible)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _hideConfirmationDialog(context);
              },
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                  child: ConfirmationDialog(
                    onYesPressed: () {
                      _hideConfirmationDialog(context);
                    },
                    onNoPressed: () {
                      _hideConfirmationDialog(context);
                    },
                  ),
                ),
              ),
            ),
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
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        for (var entry in buttonActions.entries)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.002,
            ),
            child: OutlinedButton(
              onPressed: entry.value,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.013,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(ReusableStyles.radius)),
                ),
                side: BorderSide(
                  width: screenHeight * 0.0007,
                  color: Palette.iconBlackColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key, style: textTheme.bodyLarge),
                  SvgPicture.asset(
                    AssetsConstants.rightArrowIcon,
                    colorFilter: ColorFilter.mode(
                      theme.iconTheme.color ?? Palette.iconBlackColor,
                      BlendMode.srcIn,
                    ),
                    height: screenHeight * 0.025,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
