import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/features/screens/my_page.dart';
import 'package:studentia/features/screens/main_page.dart';
import 'package:studentia/features/screens/list_page.dart';
import 'package:studentia/features/screens/notif_page.dart';
import 'package:studentia/features/screens/chatbot_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/theme/palette.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const List<Widget> navBarPages = [
    MainPage(),
    ListPage(),
    NotifPage(),
    ChatbotPage()
  ];
  int _page = 0;

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: ToolBar(
        title: _page == 0
            ? 'Studentia'
            : _page == 1
                ? 'Channels'
                : _page == 2
                    ? 'Notifications'
                    : _page == 3
                        ? 'Studentia Bot'
                        : '',
        leading: null,
        showLeading: false,
        action: SvgPicture.asset(AssetsConstants.userIcon,
            colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Palette.iconBlackColor,
                BlendMode.srcIn),
            height: 27.0),
        showActionIcon: true,
        onActionTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyPage(),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ReusableStyles.horizontalPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: IndexedStack(
                    index: _page,
                    children: navBarPages,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.homeIcon, height: 30.0),
            label: 'Home',
            activeIcon:
                SvgPicture.asset(AssetsConstants.homeActive, height: 30.0),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.listIcon, height: 28.0),
            label: 'List',
            activeIcon:
                SvgPicture.asset(AssetsConstants.listActive, height: 28.0),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.bellIcon, height: 28.0),
            label: 'Notifications',
            activeIcon:
                SvgPicture.asset(AssetsConstants.bellActive, height: 28.0),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.chatbotIcon, height: 30),
              label: 'Chatbot',
              activeIcon: SvgPicture.asset(AssetsConstants.chatbotActive,
                  height: 30.0)),
        ],
        type: BottomNavigationBarType.fixed,
        //unselectedItemColor: Theme.of(context).iconTheme.color,
        currentIndex: _page,
        onTap: onPageChange,
      ),
    );
  }
}
