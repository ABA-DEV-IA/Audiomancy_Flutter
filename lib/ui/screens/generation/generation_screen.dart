import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/ui/routes/init.dart';
import './generation_flow_page.dart';
import './widgets/init.dart';
import 'package:audiomancy_flutter/core/services/api_service.dart';
import 'package:audiomancy_flutter/data/models/track.dart';

class GenerationScreen extends StatelessWidget {
  const GenerationScreen({super.key});

  Future<void> _startGenerationProcess(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (!context.mounted) return;
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      SlideRightRoute<Map<String, dynamic>>(page: const GenerationFlowPage()),
    );

    if (result != null) {
      final String prompt = result['prompt'];
      final int trackCount = result['trackCount'];

      print(
        'Génération demandée avec prompt: "$prompt", tracks: $trackCount.',
      );

      // Show a loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating playlist...')),
      );

      try {
        final apiService = ApiService();
        final List<Track> generatedPlaylist = await apiService.generatePlaylist(prompt, trackCount);

        if (!context.mounted) return;
        ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide loading

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistScreen(playlist: generatedPlaylist),
          ),
        );
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to generate playlist: $e')),
        );
      }
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
