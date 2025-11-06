import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/ui/routes/init.dart';
import './generation_flow_page.dart';
import './widgets/init.dart';
import 'package:audiomancy_flutter/core/services/api_service.dart';
import 'package:audiomancy_flutter/data/models/playlist.dart';

class GenerationScreen extends StatelessWidget {
  const GenerationScreen({super.key});

  Future<void> _startGenerationProcess(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (!context.mounted) return;
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      SlideRightRoute<Map<String, dynamic>>(page: const GenerationFlowPage()),
    );

    if (result != null) {
      final String mood = result['mood']; // Assuming 'mood' is now returned
      final String genre = result['genre']; // Assuming 'genre' is now returned
      final String tempo = result['tempo']; // Assuming 'tempo' is now returned
      final String instrumentation = result['instrumentation']; // Assuming 'instrumentation' is now returned
      final int durationMinutes = result['durationMinutes']; // Assuming 'durationMinutes' is now returned
      final int numTracks = result['numTracks']; // Assuming 'numTracks' is now returned

      print(
        'Génération demandée avec mood: "$mood", genre: "$genre", tempo: "$tempo", instrumentation: "$instrumentation", duration: $durationMinutes min, tracks: $numTracks.',
      );

      // Show a loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating playlist...')),
      );

      try {
        final apiService = ApiService();
        final request = PlaylistGenerationRequest(
          mood: mood,
          genre: genre,
          tempo: tempo,
          instrumentation: instrumentation,
          durationMinutes: durationMinutes,
          numTracks: numTracks,
        );
        final Playlist generatedPlaylist = await apiService.generatePlaylist(request);

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
