import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/ui/routes/init.dart';
import './generation_flow_page.dart';
import './widgets/init.dart';

class GenerationScreen extends StatelessWidget {
  const GenerationScreen({super.key});

  Future<void> _startGenerationProcess(BuildContext context) async {
    // Petite attente pour laisser le temps au moteur de rendu de se "chauffer"
    await Future.delayed(const Duration(milliseconds: 50));

    if (!context.mounted) return; // Vérification de sécurité
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      SlideRightRoute<Map<String, dynamic>>(page: const GenerationFlowPage()),
    );

    if (result != null) {
      final String prompt = result['prompt'];
      final int trackCount = result['trackCount'];
      print(
        'Génération demandée avec le prompt : "$prompt" et $trackCount musiques.',
      );

      // Pour l'instant, on redirige vers la playlist "defouloir"
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlaylistScreen(jsonFile: "let_off_steam"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔮 Audiomancy'),
      ),
      body: GenerationContent(
        onStart: () => _startGenerationProcess(context),
      ),
    );
  }
}
