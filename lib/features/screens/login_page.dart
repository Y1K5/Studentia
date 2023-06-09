import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentia/theme/palette.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';
import 'package:studentia/constants/assets.dart';
import 'package:studentia/helpers/gradient_button.dart';
import './home_page.dart';
import './signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: MediaQuery.of(context).size.height * 0.03),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
                'Studentia',
                style: ReusableStyles.appGradientTitle.copyWith(fontSize: 26.0),
                gradientType: GradientType.linear,
                colors: ReusableStyles.gradientColors,
              ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              'The global community for students, by students.',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Lato',
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            // Email TextField
             TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.searchBarInputAreaColor,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ReusableStyles.radius),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                suffixIcon: null,
                hintText: 'Email',
              ),
              style: ReusableStyles.channelPostsTextStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Password TextField
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.searchBarInputAreaColor,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ReusableStyles.radius),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                suffixIcon: null,
                hintText: 'Password',
              ),
              style: ReusableStyles.channelPostsTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                    fontFamily: 'Lato'
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                // Click Here Text with Gradient
                TextButton(
                  onPressed: () {
                    
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  ),
                  child: GradientText(
                    'Click here.',
                    style: ReusableStyles.appGradientTitle.copyWith(fontSize: 12.0),
                    gradientType: GradientType.linear,
                    colors: ReusableStyles.gradientColors,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // Login Button
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ReusableStyles.gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(ReusableStyles.radius),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  elevation: 0, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ReusableStyles.radius)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Palette.lightBackgroundColor,
                    fontSize: 17.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.height * 0.0005),
                // Sign Up Text with Gradient
               TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  ),
                  child: GradientText(
                    'Sign up.',
                    style: ReusableStyles.appGradientTitle.copyWith(fontSize: 13.0),
                    gradientType: GradientType.linear,
                    colors: ReusableStyles.gradientColors,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}





