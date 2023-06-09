import 'package:flutter/material.dart';

void main() {
  runApp(StudentiaApp());
}

class StudentiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studentia',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Name with Gradient
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Color(0xFFFF006E), // Pink
                    Color(0xFF3A86FF), // Blue
                    Color(0xFF8338EC), // Purple
                  ],
                ).createShader(bounds);
              },
              child: Text(
                'Studentia',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'The global community for students, by students',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Lato',
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 50.0),
            // Email TextField
            Container(
              width: 320.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            // Password TextField
            Container(
              width: 320.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Forgot Password Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5.0),
                // Click Here Text with Gradient
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFFFF006E), // Pink
                        Color(0xFF3A86FF), // Blue
                        Color(0xFF8338EC), // Purple
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Click here',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            // Login Button
            SizedBox(
              width: 120.0,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login button press
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF006E), // Pink
                        Color(0xFF3A86FF), // Blue
                        Color(0xFF8338EC), // Purple
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You dont have an account?',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10.0),
                // Sign Up Text with Gradient
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFFFF006E), // Pink
                        Color(0xFF3A86FF), // Blue
                        Color(0xFF8338EC), // Purple
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


