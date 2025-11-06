import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/ui/screens/player/widgets/music_card.dart';
import 'package:audiomancy_flutter/ui/screens/player/modal/right_modal.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Track> loadedTracks = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadTracks();
  }

  Future<void> loadTracks() async {
    final jsonString =
        await rootBundle.loadString('assets/json/city_walk_cache.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final tracks = jsonList.map((e) => Track.fromJson(e)).toList();

    setState(() {
      loadedTracks = tracks;
      currentIndex = 0;
    });
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
      endDrawer: RightModal(
        tracks: loadedTracks,
        currentTrack: currentTrack,
        onTrackSelected: _selectTrack,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bouton playlist à droite
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: const Text('🎵 Playlist'),
                  ),
                ),
              ],
            ),
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
