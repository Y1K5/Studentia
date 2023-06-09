import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentia/theme/app_theme.dart';
import 'package:studentia/features/screens/start_page.dart';
import 'package:studentia/helpers/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeManager>(
      create: (_) => ThemeManager(),
      child: Builder(
        builder: (BuildContext context) {
          var themeManager = Provider.of<ThemeManager>(context);
          return MaterialApp(
            title: 'Studentia',
            theme: AppTheme.themeData(themeManager.darkMode, context),
            home: const StartPage(),
          );
        },
      ),
    );
  }
}
