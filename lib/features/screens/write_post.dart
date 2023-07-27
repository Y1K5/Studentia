import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({Key? key}) : super(key: key);

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postContentController = TextEditingController();
  static const int _postMaxLength = 1000;
  bool isAnonymous = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform the form submission
      _formKey.currentState!.save();
      String postContent = _postContentController.text;
      print('Post Content: $postContent');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: 'Post',
        leading: SvgPicture.asset(
          AssetsConstants.exitIcon,
          colorFilter: ColorFilter.mode(
            theme.iconTheme.color ?? Palette.iconBlackColor,
            BlendMode.srcIn,
          ),
          height: screenHeight * 0.028,
        ),
        showLeading: true,
        action: SvgPicture.asset(
          AssetsConstants.sendIcon,
          height: screenHeight * 0.033,
        ),
        showActionIcon: true,
        onActionTap: () {
          _submitForm();
        },
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * ReusableStyles.horizontalPadding,
                    vertical: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPostHeader(context, screenHeight, screenWidth),
                      _buildPostContent(
                          context, screenHeight, screenWidth, textTheme, theme),
                      _buildCommunityRules(
                          context, screenHeight, screenWidth, textTheme),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader(
      BuildContext context, double screenHeight, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What's in your mind?",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(height: screenHeight * 0.01),
        const Text(
          'Your opinion is valuable.',
          style: ReusableStyles.subtitleTextStyle,
        ),
      ],
    );
  }

  Widget _buildPostContent(BuildContext context, double screenHeight,
      double screenWidth, textTheme, theme) {
    return Column(
      children: [
        Row(
          children: [
            GradientText(
              '@ ',
              style: textTheme.titleLarge,
              gradientType: GradientType.linear,
              colors: ReusableStyles.gradientColors,
            ),
            Text(
              isAnonymous ? 'anonymous' : 'username',
              style: textTheme.titleSmall,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        SizedBox(
          height: screenHeight * 0.2,
          child: TextFormField(
            controller: _postContentController,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(
                screenWidth * 0.04,
              ),
              suffixIcon: null,
            ),
            style: textTheme.bodySmall,
            maxLines: null,
            maxLength: _postMaxLength,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the content of your post.';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsConstants.cameraIcon,
                      colorFilter: ColorFilter.mode(
                        theme.iconTheme.color ?? Palette.iconBlackColor,
                        BlendMode.srcIn,
                      ),
                      height: screenHeight * 0.031,
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    SvgPicture.asset(
                      AssetsConstants.folderIcon,
                      colorFilter: ColorFilter.mode(
                        theme.iconTheme.color ?? Palette.iconBlackColor,
                        BlendMode.srcIn,
                      ),
                      height: screenHeight * 0.032,
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isAnonymous = !isAnonymous;
                });
              },
              child: SvgPicture.asset(
                isAnonymous
                    ? AssetsConstants.glassesActive
                    : AssetsConstants.glassesIcon,
                height: screenHeight * 0.026,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommunityRules(BuildContext context, double screenHeight,
      double screenWidth, textTheme) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
        border: Border.all(
          color: Palette.iconBlackColor,
          width: screenHeight * 0.0007,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Community Rules',
                  style: textTheme.titleSmall,
                ),
                SvgPicture.asset(
                  AssetsConstants.checkActive,
                  height: screenHeight * 0.026,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: textTheme.bodySmall,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa. Lorem ipsum dolor sit amet, consectetur adipiscing elit adesmus cipsa.',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
