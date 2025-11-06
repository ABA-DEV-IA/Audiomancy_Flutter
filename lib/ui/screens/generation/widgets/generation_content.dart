import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GenerationContent extends StatelessWidget {
  final VoidCallback onStart; // Callback pour démarrer le processus

  const GenerationContent({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Créez la playlist de vos rêves',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.eclatEther, // Couleur personnalisée
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              backgroundColor: AppColors.amethyseMagique, // Couleur personnalisée
              foregroundColor: AppColors.luneVoilee, // Couleur personnalisée
            ),
            onPressed: onStart, // Utilise le callback
            icon: const Icon(Icons.auto_awesome), // Une icône pour la magie
            label: const Text('Commencer'),
          ),
        ],
      ),
    );
  }
}
