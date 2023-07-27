import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/theme/palette.dart';

class CreateChannelPage extends StatefulWidget {
  const CreateChannelPage({Key? key}) : super(key: key);

  @override
  State<CreateChannelPage> createState() => _CreateChannelPageState();
}

class _CreateChannelPageState extends State<CreateChannelPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController channelNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  static const int _channelNameMaxLines = 1;
  static const int _descriptionMaxLines = 5;
  static const int _channelNameMaxLength = 50;
  static const int _descriptionMaxLength = 300;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform the form submission
      _formKey.currentState!.save();

      // Access the channel name and description values from the form data
      String channelName = channelNameController.text;
      String description = descriptionController.text;

      // Print the channel name and description
      print('Channel Name: $channelName');
      print('Description: $description');

      // Perform other actions here based on the form data
      // You can navigate to the next page or perform other actions here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: 'Channel',
        leading: SvgPicture.asset(
          AssetsConstants.exitIcon,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color ?? Palette.iconBlackColor,
            BlendMode.srcIn,
          ),
          height: MediaQuery.of(context).size.height * 0.028,
        ),
        showLeading: true,
        action: SvgPicture.asset(
          AssetsConstants.sendIcon,
          height: MediaQuery.of(context).size.height * 0.033,
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
                    horizontal: MediaQuery.of(context).size.width *
                        ReusableStyles.horizontalPadding,
                    vertical: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTitleSection(context),
                      _buildFormSection(context),
                      _buildCommunityRulesSection(context),
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

  Widget _buildTitleSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Channel',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Text(
          'Channel your needs.',
          style: ReusableStyles.subtitleTextStyle,
        ),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Channel Name',
          style: textTheme.titleSmall,
        ),
        SizedBox(height: screenHeight * 0.015),
        SizedBox(
          child: TextFormField(
            controller: channelNameController,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              suffixIcon: null,
              fillColor: theme.inputDecorationTheme.fillColor,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: _channelNameMaxLines,
            maxLength: _channelNameMaxLength,
            expands: false,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a channel name.';
              }
              // Add more channel name validation if needed
              return null;
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          'Description',
          style: textTheme.titleSmall,
        ),
        SizedBox(height: screenHeight * 0.015),
        SizedBox(
          height: screenHeight * 0.12,
          child: TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                suffixIcon: null,
                fillColor: theme.inputDecorationTheme.fillColor),
            style: textTheme.bodySmall,
            maxLines: _descriptionMaxLines,
            maxLength: _descriptionMaxLength,
            expands: false,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            textInputAction: TextInputAction.newline,
            validator: (value) {
              // Add description validation if needed
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityRulesSection(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
        border: Border.all(
            color: Palette.iconBlackColor, width: screenHeight * 0.0007),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Community Rules',
                  style: textTheme.titleSmall,
                ),
                SvgPicture.asset(
                  AssetsConstants.checkActive,
                  height: screenHeight * 0.026,
                )
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
