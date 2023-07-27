import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/helpers/gradient_button.dart';
import './write_post.dart';

class NotifData {
  final String boardName;
  final String notifType;
  final String notifContent;

  NotifData(
      {required this.boardName,
      required this.notifType,
      required this.notifContent});
}

class NotifPage extends StatelessWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notifications = [
      NotifData(
          boardName: 'Muslim Community',
          notifType: 'comment',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Hanwoori House',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Buy & Sell',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Hanwoori House',
          notifType: 'comment',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Hanwoori House',
          notifType: 'comment',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Arab Speakers',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'CS Peers',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'The Delulus',
          notifType: 'comment',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Muslim Community',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Muslim Community',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
      NotifData(
          boardName: 'Hanwoori House',
          notifType: 'like',
          notifContent: 'Lorem ipsum dolor saquima cosectetur asifnfn...'),
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notif = notifications[index];

        return NotificationBox(
          boardName: notif.boardName,
          notifType: notif.notifType,
          notifContent: notif.notifContent,
        );
      },
    );
  }
}

class NotificationBox extends StatelessWidget {
  final String boardName;
  final String notifType;
  final String notifContent;

  const NotificationBox({
    required this.boardName,
    required this.notifType,
    required this.notifContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final board = boardName;
    final type = notifType;
    final content = notifContent;

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.3,
            color: ReusableStyles.toolBarBorder,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WritePostPage(),
            ),
          );
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08,
            vertical: screenHeight * 0.017,
          ),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UnicornOutlineButton(
              strokeWidth: 1.0,
              radius: ReusableStyles.radius,
              width: 0.1,
              height: 0.045,
              gradient: const LinearGradient(
                colors: ReusableStyles.gradientColors,
              ),
              child: SvgPicture.asset(
                type == 'like'
                    ? AssetsConstants.heartActive
                    : type == 'comment'
                        ? AssetsConstants.replyActive
                        : AssetsConstants.bellActive,
                height: screenHeight * 0.027,
              ),
              onPressed: () {},
            ),
            SizedBox(width: screenWidth * 0.05),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('$board: ', style: textTheme.titleSmall),
                      Text('new $type', style: textTheme.bodySmall),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    content,
                    style: textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
