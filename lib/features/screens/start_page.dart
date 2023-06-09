import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 90.0),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: <Color>[
                      Color(0xFFFF006E), // Pink
                      Color(0xFF3A86FF), // Blue
                      Color(0xFF8338EC), // Purple
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Studentia',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
  onPressed: () {
    // Handle login button press
  },
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    primary: Colors.white,
    onSurface: Colors.transparent,
  ),
  child: Ink(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFFFF006E), // Pink
          Color(0xFF3A86FF), // Blue
          Color(0xFF8338EC), // Purple
        ],
      ),
    ),
    child: Container(
      width: 130.0,
      height: 45.0,
      alignment: Alignment.center,
      child: Text(
        'Log in',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ).createShader(
              Rect.fromLTWH(0.0, 0.0, 130.0, 45.0),
            ),
        ),
      ),
    ),
  ),
),
const SizedBox(height: 13.0),
ElevatedButton(
  onPressed: () {
    // Handle sign-up button press
  },
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    primary: Colors.white,
    onSurface: Colors.transparent,
  ),
  child: Ink(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFFFF006E), // Pink
          Color(0xFF3A86FF), // Blue
          Color(0xFF8338EC), // Purple
        ],
      ),
    ),
    child: Container(
      width: 130.0,
      height: 45.0,
      alignment: Alignment.center,
      child: Text(
        'Sign up',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ).createShader(
              Rect.fromLTWH(0.0, 0.0, 130.0, 45.0),
            ),
        ),
      ),
    ),
  ),
),
const SizedBox(height: 20.0),


            ],
          ),
        ),
      ),
    );
  }
}











