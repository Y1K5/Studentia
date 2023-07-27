import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';
import '../theme/palette.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  const ToolBar({
    Key? key,
    this.title = '',
    this.leading,
    this.action,
    this.showActionIcon = false,
    this.showLeading = false,
    this.onActionTap,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? action;
  final bool showActionIcon;
  final bool showLeading;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Palette.borderGrayColor, width: 0.2),
          ),
        ),
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (showLeading)
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: leading!),
                    GradientText(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                      gradientType: GradientType.linear,
                      colors: ReusableStyles.gradientColors,
                    ),
                    if (showActionIcon)
                      InkWell(onTap: onActionTap, child: action!)
                  ],
                ))));
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
