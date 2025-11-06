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
    // Récupère les couleurs du thème actuel
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      width: 320,
      backgroundColor: colorScheme.background, // couleur du fond du Drawer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.9),
            ),
            margin: EdgeInsets
                .zero, // supprime les marges par défaut du DrawerHeader
            padding: EdgeInsets.all(16),
            child: SizedBox.expand(
              child: Align(
                alignment: Alignment.centerLeft, // ou Alignment.center
                child: Text(
                  '🎧 Playlist',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                      ? theme.colorScheme.secondary.withOpacity(0.15)
                      : Colors.transparent,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        track.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      track.title,
                      style: TextStyle(
                        color: isCurrent
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.onBackground,
                        fontWeight: isCurrent
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      track.artist,
                      style: TextStyle(
                        color: theme.colorScheme.onBackground.withOpacity(0.7),
                      ),
                    ),
                    trailing: isCurrent
                        ? Icon(
                            Icons.play_arrow_rounded,
                            color: theme.colorScheme.secondary, // Vert du thème
                            size: 28,
                          )
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
