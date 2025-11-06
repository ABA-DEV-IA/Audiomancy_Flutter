import 'package:json_annotation/json_annotation.dart';
import 'package:audiomancy_flutter/data/models/track.dart';

part 'playlist.g.dart';

@JsonSerializable()
class TrackInPlaylist {
  final String id;
  final String name;
  @JsonKey(name: 'artist_name')
  final String artistName;
  @JsonKey(name: 'audio_url')
  final String audioUrl;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'duration_seconds')
  final int durationSeconds;

  TrackInPlaylist({
    required this.id,
    required this.name,
    required this.artistName,
    required this.audioUrl,
    required this.imageUrl,
    required this.durationSeconds,
  });

  factory TrackInPlaylist.fromJson(Map<String, dynamic> json) =>
      _$TrackInPlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$TrackInPlaylistToJson(this);
}

@JsonSerializable()
class Playlist {
  final String name;
  final String description;
  final List<TrackInPlaylist> tracks;

  Playlist({
    required this.name,
    required this.description,
    required this.tracks,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

@JsonSerializable()
class PlaylistGenerationRequest {
  final String mood;
  final String genre;
  final String tempo;
  final String instrumentation;
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @JsonKey(name: 'num_tracks')
  final int numTracks;

  PlaylistGenerationRequest({
    required this.mood,
    required this.genre,
    required this.tempo,
    required this.instrumentation,
    required this.durationMinutes,
    required this.numTracks,
  });

  factory PlaylistGenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaylistGenerationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistGenerationRequestToJson(this);
}
