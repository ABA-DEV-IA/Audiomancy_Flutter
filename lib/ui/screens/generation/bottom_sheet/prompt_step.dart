import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PromptStep extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onNext;

  const PromptStep({super.key, required this.controller, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Décrivez votre playlist idéale', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.eclatEther)),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              autofocus: true,
              style: const TextStyle(color: AppColors.luneVoilee),
              decoration: const InputDecoration(
                hintText: 'Ex: Rock énergique pour le sport...',
                hintStyle: TextStyle(color: AppColors.luneVoilee),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.amethyseMagique),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.vertDragon),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: onNext,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.vertDragon,
                  foregroundColor: AppColors.brumeCosmique,
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Suivant'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
