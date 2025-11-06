import 'package:audiomancy_flutter/ui/screens/tapbar/tapbar.dart';
import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme, // Thème clair
      darkTheme: AppTheme.darkTheme, // Thème sombre
      themeMode: ThemeMode.system, // Utilise le thème du système (Android/iOS)
      home: TapBarScreen(),
    );
  }
}
