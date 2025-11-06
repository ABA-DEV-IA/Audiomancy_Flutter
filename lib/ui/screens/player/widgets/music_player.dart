import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final String audioUrl;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const MusicPlayer({
    super.key,
    required this.audioUrl,
    this.onNext,
    this.onPrevious,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  @override
  void didUpdateWidget(MusicPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.audioUrl != oldWidget.audioUrl) {
      // Quand la musique change, on relance la lecture automatique
      _playNewTrack();
    }
  }

  void _initAudio() {
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() => _duration = d);
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() => _position = p);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
      // Appel du callback "suivant" automatiquement à la fin
      widget.onNext?.call();
    });

    _playNewTrack();
  }

  Future<void> _playNewTrack() async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(widget.audioUrl));
    setState(() => _isPlaying = true);
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() => _isPlaying = false);
    } else {
      await _audioPlayer.resume();
      setState(() => _isPlaying = true);
    }
  }

  Future<void> _seekTo(double seconds) async {
    final newPosition = Duration(seconds: seconds.toInt());
    await _audioPlayer.seek(newPosition);
  }

  String _formatTime(Duration d) {
    final minutes = d.inMinutes.toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _position.inSeconds.toDouble(),
          max: _duration.inSeconds.toDouble().clamp(1, double.infinity),
          onChanged: (value) => _seekTo(value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatTime(_position)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 35,
                  onPressed: widget.onPrevious,
                ),
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 40,
                  onPressed: _togglePlayPause,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 35,
                  onPressed: widget.onNext,
                ),
              ],
            ),
            Text(_formatTime(_duration)),
          ],
        ),
      ],
    );
  }
}
