import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/helpers/gradient_button.dart';
import 'package:studentia/features/screens/login_page.dart';
import 'package:studentia/features/screens/signup_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SvgPicture.asset(AssetsConstants.logo4,
                  height: screenHeight * 0.15),
              SizedBox(height: screenHeight * 0.02),
              // App Title
              GradientText(
                'Studentia',
                style: textTheme.headlineLarge,
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
              // Blank Space
              SizedBox(height: screenHeight * 0.1),
              // Log in Button
              UnicornOutlineButton(
                strokeWidth: 1,
                radius: ReusableStyles.radius,
                width: screenWidth * 0.001,
                height: screenHeight * 0.000065,
                gradient:
                    const LinearGradient(colors: ReusableStyles.gradientColors),
                child: GradientText(
                  'Log in',
                  style: textTheme.labelMedium,
                  gradientType: GradientType.linear,
                  colors: ReusableStyles.gradientColors,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              // Blank Space
              SizedBox(height: screenHeight * 0.03),
              // Sign Up Button
              UnicornOutlineButton(
                strokeWidth: 1.0,
                radius: ReusableStyles.radius,
                width: screenWidth * 0.001,
                height: screenHeight * 0.000065,
                gradient:
                    const LinearGradient(colors: ReusableStyles.gradientColors),
                child: GradientText(
                  'Sign up',
                  style: textTheme.labelMedium,
                  gradientType: GradientType.linear,
                  colors: ReusableStyles.gradientColors,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
