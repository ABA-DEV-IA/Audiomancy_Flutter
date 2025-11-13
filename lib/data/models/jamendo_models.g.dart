// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jamendo_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JamendoTrackRequest _$JamendoTrackRequestFromJson(Map<String, dynamic> json) =>
    JamendoTrackRequest(
      tags: json['tags'] as String,
      durationMin: (json['duration_min'] as num?)?.toInt() ?? 180,
      durationMax: (json['duration_max'] as num?)?.toInt() ?? 480,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      trackId: json['trackId'] as String?,
    );

Map<String, dynamic> _$JamendoTrackRequestToJson(
  JamendoTrackRequest instance,
) => <String, dynamic>{
  'tags': instance.tags,
  'duration_min': instance.durationMin,
  'duration_max': instance.durationMax,
  'limit': instance.limit,
  'trackId': instance.trackId,
};

JamendoTrackResponse _$JamendoTrackResponseFromJson(
  Map<String, dynamic> json,
) => JamendoTrackResponse(
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

Map<String, dynamic> _$JamendoTrackResponseToJson(
  JamendoTrackResponse instance,
) => <String, dynamic>{
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
