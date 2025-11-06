import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/core/themes/app_theme.dart';
import 'package:audiomancy_flutter/ui/screens/generation/generation_screen.dart';

void main() {
  runApp(const GenerationApp());
}

class GenerationApp extends StatelessWidget {
  const GenerationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const GenerationScreen(),
    );
  }
}
