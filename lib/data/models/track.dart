import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  final String id;
  final String name;
  @JsonKey(name: 'artist_name')
  final String artistName;
  final String audio;
  final String image;
  final int duration;

  Track({
    required this.id,
    required this.name,
    required this.artistName,
    required this.audio,
    required this.image,
    required this.duration,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}