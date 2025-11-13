import 'package:json_annotation/json_annotation.dart';

part 'jamendo_models.g.dart';

@JsonSerializable()
class JamendoTrackRequest {
  final String tags;
  @JsonKey(name: 'duration_min')
  final int durationMin;
  @JsonKey(name: 'duration_max')
  final int durationMax;
  final int limit;
  @JsonKey(name: 'trackId')
  final String? trackId;

  JamendoTrackRequest({
    required this.tags,
    this.durationMin = 180,
    this.durationMax = 480,
    this.limit = 10,
    this.trackId,
  });

  factory JamendoTrackRequest.fromJson(Map<String, dynamic> json) =>
      _$JamendoTrackRequestFromJson(json);
  Map<String, dynamic> toJson() => _$JamendoTrackRequestToJson(this);
}

@JsonSerializable()
class JamendoTrackResponse {
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

  JamendoTrackResponse({
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

  factory JamendoTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$JamendoTrackResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JamendoTrackResponseToJson(this);
}
