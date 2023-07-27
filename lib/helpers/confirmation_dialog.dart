import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/helpers/gradient_button.dart';
import 'package:studentia/theme/palette.dart';

class ConfirmationDialog extends StatelessWidget {
  final Function onYesPressed;
  final Function onNoPressed;

  const ConfirmationDialog({
    Key? key,
    required this.onYesPressed,
    required this.onNoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: AlertDialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ReusableStyles.radius),
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          title: const Center(child: Text('Are you sure?')),
          titleTextStyle: textTheme.titleMedium,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actionsPadding: EdgeInsets.only(bottom: screenHeight * 0.025),
          actions: <Widget>[
            OutlinedButton(
                onPressed: () {
                  onYesPressed();
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.00005,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(ReusableStyles.radius),
                    ),
                  ),
                  side: BorderSide(
                    width: screenHeight * 0.0007,
                    color: theme.iconTheme.color ?? Palette.iconBlackColor,
                  ),
                ),
                child: Text('Yes', style: textTheme.titleSmall)),
            UnicornOutlineButton(
              onPressed: () {
                onNoPressed();
              },
              strokeWidth: 1,
              radius: ReusableStyles.radius,
              width: screenWidth * 0.0006,
              height: screenHeight * 0.000053,
              gradient:
                  const LinearGradient(colors: ReusableStyles.gradientColors),
              child: GradientText(
                'No',
                style: textTheme.titleSmall,
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
