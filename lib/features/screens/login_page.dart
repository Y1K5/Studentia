import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/theme/palette.dart';
import 'package:studentia/constants/styles.dart';
import './home_page.dart';
import './signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

  // Create a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  // Variables to store the form field values
  String _email = '';
  String _password = '';

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, perform authentication or other actions
      print('Email: $_email, Password: $_password');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.145,
            vertical: screenHeight * 0.03,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Title (Replace with your gradient text)
                GradientText(
                  'Studentia.',
                  style: textTheme.headlineMedium,
                  gradientType: GradientType.linear,
                  colors: ReusableStyles.gradientColors,
                ),
                // Blank Space
                SizedBox(height: screenHeight * 0.01),
                // Lemma
                Text(
                  'The community for students, by students.',
                  style: TextStyle(
                    fontSize: screenHeight * 0.0148,
                    fontFamily: 'Lato',
                    color: Palette.subtitleBlackColor,
                  ),
                ),
                // Blank Space
                SizedBox(height: screenHeight * 0.07),
                // Email TextFormField
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@ewhain.net')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.sqRadius),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.045,
                      vertical: screenHeight * 0.02,
                    ),
                    hintText: 'example@ewhain.net',
                    hintStyle: textTheme.bodyMedium,
                  ),
                  style: textTheme.bodyMedium,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                // Blank Space
                SizedBox(height: screenHeight * 0.03),
                // Password TextFormField
                TextFormField(
                  obscureText: !passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.sqRadius),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.045,
                      vertical: screenHeight * 0.016,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: theme.iconTheme.color,
                      ),
                      onPressed: togglePasswordVisibility,
                    ),
                    hintText: 'Password',
                    hintStyle: textTheme.bodyMedium,
                  ),
                  style: textTheme.bodyMedium,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                // Forgot password?
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: Text(
                    'Forgot password?',
                    style: textTheme.bodyMedium,
                  ),
                ),
                // Blank Space
                SizedBox(height: screenHeight * 0.03),
                // Login Button (Replace with your gradient button)
                TextButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: Container(
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.055,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: ReusableStyles.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.sqRadius),
                    ),
                    child: Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Palette.lightBackgroundColor,
                          fontSize: screenHeight * 0.0185,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                // Blank Space
                SizedBox(height: screenHeight * 0.05),
                // Don't have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No account?",
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    // Sign Up Now Text with Gradient (Replace with your navigation logic)
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero,
                        ),
                      ),
                      child: GradientText(
                        'Create one.',
                        style: ReusableStyles.appGradientTitle.copyWith(
                          fontSize: screenHeight * 0.016,
                        ),
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
