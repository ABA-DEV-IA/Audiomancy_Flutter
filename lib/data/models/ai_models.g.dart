// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromptRequest _$PromptRequestFromJson(Map<String, dynamic> json) =>
    PromptRequest(
      prompt: json['prompt'] as String,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$PromptRequestToJson(PromptRequest instance) =>
    <String, dynamic>{'prompt': instance.prompt, 'limit': instance.limit};
