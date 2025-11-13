// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedTrack _$GeneratedTrackFromJson(Map<String, dynamic> json) =>
    GeneratedTrack(
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

Map<String, dynamic> _$GeneratedTrackToJson(GeneratedTrack instance) =>
    <String, dynamic>{
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
