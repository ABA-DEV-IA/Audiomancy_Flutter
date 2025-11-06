import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:flutter/material.dart';
import 'music_thumbnail.dart';
import 'music_info.dart';
import 'music_player.dart';

class MusicCard extends StatelessWidget {
  final Track track;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const MusicCard({
    super.key,
    required this.track,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MusicThumbnail(imageUrl: track.image),
            const SizedBox(height: 12),
            MusicInfo(
              title: track.title,
              author: track.artist,
              license: track.licenseName,
            ),
            const SizedBox(height: 12),
            MusicPlayer(
              audioUrl: track.audioUrl,
              onNext: onNext,
              onPrevious: onPrevious,
            ),
          ],
        ),
      ),
    );
  }
}
