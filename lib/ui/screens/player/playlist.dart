import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/ui/screens/player/widgets/music_card.dart';
import 'package:audiomancy_flutter/ui/screens/player/modal/right_modal.dart';
import 'package:audiomancy_flutter/core/services/track_service.dart';

class PlaylistScreen extends StatefulWidget {
  final String? jsonFile;
  final String? jsonContent;

  const PlaylistScreen({super.key, this.jsonFile, this.jsonContent});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Track> loadedTracks = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadTracks();
  }

  Future<void> _loadTracks() async {
    try {
      final tracks = await TrackService.loadTracks(
        fileName: widget.jsonFile,
        jsonContent: widget.jsonContent,
      );
      setState(() {
        loadedTracks = tracks;
        currentIndex = 0;
      });
    } catch (e) {
      debugPrint('Erreur de chargement des pistes: $e');
    }
  }

  void _nextTrack() {
    if (currentIndex < loadedTracks.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _previousTrack() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  void _selectTrack(Track track) {
    final index = loadedTracks.indexWhere((t) => t.id == track.id);
    if (index != -1) {
      setState(() => currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loadedTracks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final currentTrack = loadedTracks[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🔮 Audiomancy'),
      ),
      endDrawer: RightModal(
        tracks: loadedTracks,
        currentTrack: currentTrack,
        onTrackSelected: _selectTrack,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            // Carte musique avec boutons précédent / suivant
            MusicCard(
              track: currentTrack,
              onNext: _nextTrack,
              onPrevious: _previousTrack,
            ),
          ],
        ),
      ),
    );
  }
}
