import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/ui/screens/player/widgets/music_card.dart';
import 'package:audiomancy_flutter/ui/screens/player/modal/right_modal.dart';

class PlaylistScreen extends StatefulWidget {
  final List<Track> playlist;

  const PlaylistScreen({super.key, required this.playlist});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Track> loadedTracks = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadedTracks = widget.playlist;
    currentIndex = 0;
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
      return Scaffold(
        appBar: AppBar(
          title: Text('Playlist'),
        ),
        body: Center(child: Text('No tracks in this playlist.'))
      );
    }

    final currentTrack = loadedTracks[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Generated Playlist"),
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
