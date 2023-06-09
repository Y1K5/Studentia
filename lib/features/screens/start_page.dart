import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/theme/palette.dart';
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
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Palette.lightBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsConstants.logo, height: 90.0),
              const SizedBox(height: 20.0),
              GradientText(
                'Studentia',
                style: ReusableStyles.appGradientTitle.copyWith(fontSize: 30.0),
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
              const SizedBox(height: 60.0),
              UnicornOutlineButton(
                strokeWidth: 1,
                radius: ReusableStyles.radius,
                width: 0.5,
                height: 0.05,
                gradient: LinearGradient(colors: ReusableStyles.gradientColors),
                child: 
                  GradientText(
                    'Log in',
                    style: ReusableStyles.myPageButtons.copyWith(fontSize: 16.0, fontWeight: FontWeight.w900),
                    gradientType: GradientType.linear,
                    colors: ReusableStyles.gradientColors,
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25.0),
              UnicornOutlineButton(
                strokeWidth: 1,
                radius: ReusableStyles.radius,
                width: 0.5,
                height: 0.05,
                gradient: LinearGradient(colors: ReusableStyles.gradientColors),
                child: 
                  GradientText(
                    'Sign up',
                    style: ReusableStyles.myPageButtons.copyWith(fontSize: 16.0, fontWeight: FontWeight.w900),
                    gradientType: GradientType.linear,
                    colors: ReusableStyles.gradientColors,
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}



















