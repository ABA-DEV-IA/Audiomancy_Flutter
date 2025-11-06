import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:flutter/material.dart';

class RightModal extends StatelessWidget {
  final List<Track> tracks;
  final Track? currentTrack;
  final Function(Track) onTrackSelected;

  const RightModal({
    super.key,
    required this.tracks,
    required this.currentTrack,
    required this.onTrackSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrawerHeader(
            child: Text(
              '🎧 Playlist',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final track = tracks[index];
                final isCurrent = currentTrack?.id == track.id;

                return Container(
                  color: isCurrent
                      ? Colors.deepPurple.withOpacity(0.1)
                      : Colors.transparent,
                  child: ListTile(
                    leading: Image.network(
                      track.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(track.title),
                    subtitle: Text(track.artist),
                    trailing: isCurrent
                        ? const Icon(Icons.play_arrow, color: Colors.green)
                        : null,
                    onTap: () {
                      Navigator.of(context).maybePop(); // Ferme la modale
                      onTrackSelected(track);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
