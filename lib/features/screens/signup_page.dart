import 'package:flutter/material.dart';
import 'package:studentia/theme/palette.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:studentia/constants/styles.dart';
import './login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  // GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      confirmPasswordVisible = !confirmPasswordVisible;
    });
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, perform registration or other actions
      print(
          'Username: $_username, Email: $_email, Password: $_password, Confirm Password: $_confirmPassword');
      // You can perform registration or navigate to the login page here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  Widget buildPasswordTextField(String hintText, bool isVisible) {
    return TextFormField(
      obscureText: !isVisible,
      enableSuggestions: false,
      autocorrect: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        if (hintText == 'Password' && value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        if (hintText == 'Confirm password' && value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ReusableStyles.sqRadius),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.045,
          vertical: MediaQuery.of(context).size.height * 0.016,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            if (hintText == 'Password') {
              togglePasswordVisibility();
            } else if (hintText == 'Confirm password') {
              toggleConfirmPasswordVisibility();
            }
          },
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: (value) {
        setState(() {
          if (hintText == 'Username') {
            _username = value;
          } else if (hintText == 'Email') {
            _email = value;
          } else if (hintText == 'Password') {
            _password = value;
          } else if (hintText == 'Confirm password') {
            _confirmPassword = value;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final commonHSpacer = screenHeight * 0.03;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.145,
            vertical: screenHeight * 0.02,
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
                SizedBox(height: screenHeight * 0.05),
                // Username TextFormField
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.radius),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.045,
                      vertical: screenHeight * 0.02,
                    ),
                    hintText: 'Username',
                    hintStyle: textTheme.bodyMedium,
                  ),
                  style: textTheme.bodyMedium,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username.';
                    }
                    // Add more username validation if needed
                    return null;
                  },
                ),
                // Blank Space
                SizedBox(height: commonHSpacer),
                // Email TextField
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ReusableStyles.radius),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    if (!value.contains('@ewhain.net')) {
                      return 'Please enter a valid email address';
                    }
                    // Add more email validation if needed
                    return null;
                  },
                ),
                // Blank Space
                SizedBox(height: commonHSpacer),
                // Password Textfield
                buildPasswordTextField('Password', passwordVisible),
                // Blank Space
                SizedBox(height: commonHSpacer),
                // Confirm Password Textfield
                buildPasswordTextField(
                    'Confirm password', confirmPasswordVisible),
                // Blank Space
                SizedBox(height: commonHSpacer),
                // Sign up Button (Replace with your gradient button)
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
                        'Sign up',
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
                // Have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: textTheme.bodyMedium),
                    // Blank Space Horizontal
                    SizedBox(width: screenWidth * 0.01),
                    // Log in Text with Gradient
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
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
                        'Log in here.',
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
