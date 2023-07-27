import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentia/theme/app_theme.dart';
import 'package:studentia/features/screens/start_page.dart';
import 'helpers/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeManager(),
        builder: (context, _) {
          final themeManager = Provider.of<ThemeManager>(context);

          return MaterialApp(
            title: 'Studentia',
            theme: AppTheme.themeData(themeManager.darkMode, context),
            home: const StartPage(),
          );
        },
      );
}
