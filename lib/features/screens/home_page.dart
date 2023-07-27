import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/common/toolbar.dart';
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
            height: MediaQuery.of(context).size.height * 0.033),
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
        child: IndexedStack(
          index: _page,
          children: navBarPages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.homeIcon,
                height: MediaQuery.of(context).size.height * 0.035),
            label: 'Home',
            activeIcon: SvgPicture.asset(AssetsConstants.homeActive,
                height: MediaQuery.of(context).size.height * 0.035),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.listIcon,
                height: MediaQuery.of(context).size.height * 0.032),
            label: 'List',
            activeIcon: SvgPicture.asset(AssetsConstants.listActive,
                height: MediaQuery.of(context).size.height * 0.032),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.bellIcon,
                height: MediaQuery.of(context).size.height * 0.032),
            label: 'Notifications',
            activeIcon: SvgPicture.asset(AssetsConstants.bellActive,
                height: MediaQuery.of(context).size.height * 0.032),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.chatbotIcon,
                  height: MediaQuery.of(context).size.height * 0.035),
              label: 'Chatbot',
              activeIcon: SvgPicture.asset(AssetsConstants.chatbotActive,
                  height: MediaQuery.of(context).size.height * 0.035)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: onPageChange,
      ),
    );
  }
}
