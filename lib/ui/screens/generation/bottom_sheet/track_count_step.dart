import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TrackCountStep extends StatelessWidget {
  final Function(int) onTrackCountSelected;
  final VoidCallback onBack;

  const TrackCountStep({super.key, required this.onTrackCountSelected, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2. Combien de musiques ?', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.eclatEther)),
            const SizedBox(height: 20),
            ...[10, 25, 50].map((count) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.amethyseMagique,
                    foregroundColor: AppColors.luneVoilee,
                  ),
                  onPressed: () => onTrackCountSelected(count),
                  child: Text('$count musiques'),
                ),
              );
            }),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: onBack,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.givreAstral,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Retour'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
