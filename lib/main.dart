import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,       // Thème clair
      darkTheme: AppTheme.darkTheme,    // Thème sombre
      themeMode: ThemeMode.system,      // Utilise le thème du système (Android/iOS)
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
