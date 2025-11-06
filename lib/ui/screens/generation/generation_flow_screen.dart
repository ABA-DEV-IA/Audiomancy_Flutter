import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet/generation_bottom_sheet.dart';

class GenerationFlowScreen extends StatelessWidget {
  const GenerationFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ombreOcculte, // Fond opaque pour corriger l'animation
      appBar: AppBar(
        title: const Text('Nouvelle Incantation'),
        backgroundColor: AppColors.brumeCosmique, // Thème sombre
        elevation: 0,
      ),
      body: const GenerationBottomSheet(),
    );
  }
}
