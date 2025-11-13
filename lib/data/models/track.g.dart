// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  audioUrl: json['audio_url'] as String,
  duration: (json['duration'] as num).toInt(),
  licenseName: json['license_name'] as String?,
  licenseUrl: json['license_url'] as String?,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'audio_url': instance.audioUrl,
  'duration': instance.duration,
  'license_name': instance.licenseName,
  'license_url': instance.licenseUrl,
  'tags': instance.tags,
  'image': instance.image,
};
