import 'package:flutter/material.dart';
// NOTE: Le contenu de cet écran est obsolète et cause des erreurs.
// Il a été commenté en attendant une mise à jour.
// import 'package:audiomancy_flutter/core/services/api_service.dart';
// import 'package:audiomancy_flutter/data/models/track.dart';

/* class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Track> _jamendoTracks = [];
  List<Track> _generatedPlaylist = [];
  String _errorMessage = '';

  Future<void> _fetchJamendoTracks() async {
    setState(() {
      _errorMessage = '';
    });
    // try {
    //   // NOTE: getJamendoTracks n'existe plus dans ApiService.
    //   // Il faudrait créer une nouvelle méthode pour cette fonctionnalité.
    //   // final tracks = await _apiService.getJamendoTracks("rock+pop", 10);
    //   // setState(() {
    //   //   _jamendoTracks = tracks;
    //   //   _generatedPlaylist = [];
    //   // });
    // } catch (e) {
    //   setState(() {
    //     _errorMessage = 'Error fetching Jamendo tracks: ${e.toString()}';
    //   });
    // }
  }

  Future<void> _generatePlaylist() async {
    setState(() {
      _errorMessage = '';
    });
    // try {
    //   final playlist = await _apiService.generatePlaylist(
    //     "Génère moi une playlist pour me détendre.",
    //     5,
    //   );
    //   setState(() {
    //     _generatedPlaylist = playlist;
    //     _jamendoTracks = [];
    //   });
    // } catch (e) {
    //   setState(() {
    //     _errorMessage = 'Error generating playlist: ${e.toString()}';
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audiomancy API Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _fetchJamendoTracks,
              child: const Text('Fetch Jamendo Tracks (rock+pop)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generatePlaylist,
              child: const Text('Generate AI Playlist (détente)'),
            ),
            const SizedBox(height: 16),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            if (_jamendoTracks.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _jamendoTracks.length,
                  itemBuilder: (context, index) {
                    final track = _jamendoTracks[index];
                    return ListTile(
                      title: Text(track.title),
                      subtitle: Text(track.artist),
                      trailing: Text('${track.duration}s'),
                    );
                  },
                ),
              ),
            if (_generatedPlaylist.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _generatedPlaylist.length,
                  itemBuilder: (context, index) {
                    final track = _generatedPlaylist[index];
                    return ListTile(
                      title: Text(track.title),
                      subtitle: Text(track.artist),
                      trailing: Text('${track.duration}s'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
} */

/// Écran d'accueil temporaire en attendant la mise à jour de l'ancien code.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audiomancy API Demo')),
      body: const Center(child: Text('Cet écran est en cours de maintenance.')),
    );
  }
}
