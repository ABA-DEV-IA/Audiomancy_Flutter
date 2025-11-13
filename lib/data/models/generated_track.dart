
import 'package:json_annotation/json_annotation.dart';

part 'generated_track.g.dart';

@JsonSerializable()
class GeneratedTrack {
  final String id;
  final String title;
  final String artist;
  @JsonKey(name: 'audio_url')
  final String audioUrl;
  final int duration;
  @JsonKey(name: 'license_name')
  final String? licenseName;
  @JsonKey(name: 'license_url')
  final String? licenseUrl;
  final List<String> tags;
  final String? image;

  GeneratedTrack({
    required this.id,
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.duration,
    this.licenseName,
    this.licenseUrl,
    required this.tags,
    this.image,
  });

  factory GeneratedTrack.fromJson(Map<String, dynamic> json) =>
      _$GeneratedTrackFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedTrackToJson(this);
}
