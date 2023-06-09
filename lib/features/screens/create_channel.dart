import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/searchbar.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';

class CreateChannelPage extends StatelessWidget {
  const CreateChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: 'Channel',
        leading: SvgPicture.asset(
          AssetsConstants.exitIcon,
          colorFilter: const ColorFilter.mode(
            Palette.iconBlackColor,
            BlendMode.srcIn,
          ),
          height: 24.0,
        ),
        showLeading: true,
        action: SvgPicture.asset(
          AssetsConstants.sendIcon, height: 28.0),
        showActionIcon: true,
        onActionTap: null
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Create Channel',
                        style: ReusableStyles.titleTextStyle),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Channel your needs.',
                      style: ReusableStyles.subtitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Channel Name', style: ReusableStyles.titleTextStyle.copyWith(fontSize: 14.0)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.04,
                            vertical: MediaQuery.of(context).size.height * 0.015),
                        suffixIcon: null
                      ),
                      style: ReusableStyles.channelPostsTextStyle
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: ReusableStyles.titleTextStyle.copyWith(fontSize: 14.0),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                          vertical: MediaQuery.of(context).size.height * 0.05,
                        ),
                        suffixIcon: null,
                      ),
                      style: ReusableStyles.channelPostsTextStyle,
                      maxLines: null, 
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.02
                    ),
                    child:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Community Rules',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),                  
                            SvgPicture.asset(AssetsConstants.checkIcon, height: 22.0),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa.',
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                        ),
                      ],
                    ),
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