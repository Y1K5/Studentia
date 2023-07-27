import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import '../../constants/styles.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  String userMessage = "";
  String chatbotMessage = "";

  void sendMessage(String message) {
    setState(() {
      userMessage = message;
      // Simulate the chatbot's response with a predefined message
      chatbotMessage = "I received your message: '$message'.";
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    var commonSpacer = screenHeight * 0.02;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * ReusableStyles.horizontalPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: commonSpacer),
                    if (userMessage.isNotEmpty) UserMessages(userMessage),
                    if (chatbotMessage.isNotEmpty)
                      ChatbotMessages(chatbotMessage),
                  ],
                ),
              ),
            )
          ],
        ),
        BotInputBox(onSendMessage: sendMessage),
      ],
    );
  }
}

class UserMessages extends StatelessWidget {
  final String message;

  const UserMessages(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var commonSpacer = screenHeight * 0.02;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.7,
                color: ReusableStyles.toolBarBorder,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(ReusableStyles.radius),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenHeight * 0.02,
                vertical: screenHeight * 0.014,
              ),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        SizedBox(height: commonSpacer),
      ],
    );
  }
}

class ChatbotMessages extends StatelessWidget {
  final String message;

  const ChatbotMessages(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var commonSpacer = screenHeight * 0.02;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: ReusableStyles.gradientColors,
                ),
                borderRadius: BorderRadius.circular(ReusableStyles.radius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.7),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(ReusableStyles.radius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: commonSpacer,
                        vertical: screenHeight * 0.014),
                    child: Center(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: commonSpacer),
      ],
    );
  }
}

class BotInputBox extends StatefulWidget {
  final Function(String) onSendMessage; // Define the callback function

  const BotInputBox({required this.onSendMessage, Key? key}) : super(key: key);

  @override
  _BotInputBoxState createState() => _BotInputBoxState();
}

class _BotInputBoxState extends State<BotInputBox> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    String message = _textEditingController.text;
    if (message.isNotEmpty) {
      widget.onSendMessage(message);
      //widget.onSendMessage('user:$message'); // Prefix the message as 'user:'
      _textEditingController.clear();
    }

    // Close the keyboard after sending the message
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var commonHSpacer = screenHeight * 0.015;
    var commonWSpacer = screenWidth * 0.04;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.015),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.sqRadius),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(
                      commonWSpacer,
                      commonHSpacer,
                      0,
                      commonHSpacer,
                    ),
                    suffixIcon: null,
                    fillColor: theme.inputDecorationTheme.fillColor,
                  ),
                  style: theme.textTheme.bodySmall,
                  maxLines: 1,
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                commonHSpacer,
                commonWSpacer,
                commonHSpacer,
              ),
              child: InkWell(
                onTap: _handleSendMessage,
                child: SvgPicture.asset(AssetsConstants.sendIcon,
                    height: screenHeight * 0.047),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
