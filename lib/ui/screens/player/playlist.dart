import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/data/models/playlist.dart';
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/ui/screens/player/widgets/music_card.dart';
import 'package:audiomancy_flutter/ui/screens/player/modal/right_modal.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({super.key, required this.playlist});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<TrackInPlaylist> loadedTracks = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadedTracks = widget.playlist.tracks;
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

  void _selectTrack(TrackInPlaylist track) {
    final index = loadedTracks.indexWhere((t) => t.id == track.id);
    if (index != -1) {
      setState(() => currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loadedTracks.isEmpty) {
      return const Center(child: Text('No tracks in this playlist.'));
    }

    final currentTrack = loadedTracks[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playlist.name),
      ),
      endDrawer: RightModal(
        tracks: loadedTracks.map((t) => Track(
          id: t.id,
          name: t.name,
          artistName: t.artistName,
          audio: t.audioUrl,
          image: t.imageUrl,
          duration: t.durationSeconds,
        )).toList(),
        currentTrack: Track(
          id: currentTrack.id,
          name: currentTrack.name,
          artistName: currentTrack.artistName,
          audio: currentTrack.audioUrl,
          image: currentTrack.imageUrl,
          duration: currentTrack.durationSeconds,
        ),
        onTrackSelected: (track) => _selectTrack(TrackInPlaylist(
          id: track.id,
          name: track.name,
          artistName: track.artistName,
          audioUrl: track.audio,
          imageUrl: track.image,
          durationSeconds: track.duration,
        )),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            MusicCard(
              track: Track(
                id: currentTrack.id,
                name: currentTrack.name,
                artistName: currentTrack.artistName,
                audio: currentTrack.audioUrl,
                image: currentTrack.imageUrl,
                duration: currentTrack.durationSeconds,
              ),
              onNext: _nextTrack,
              onPrevious: _previousTrack,
            ),
          ],
        ),
      ),
    );
  }
}
