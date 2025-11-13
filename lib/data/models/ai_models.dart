import 'package:json_annotation/json_annotation.dart';
import 'package:audiomancy_flutter/data/models/jamendo_models.dart';

part 'ai_models.g.dart';

@JsonSerializable()
class PromptRequest {
  final String prompt;
  final int limit;

  PromptRequest({
    required this.prompt,
    this.limit = 10,
  });

  factory PromptRequest.fromJson(Map<String, dynamic> json) =>
      _$PromptRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PromptRequestToJson(this);
}

// GeneratedTrack is the same as JamendoTrackResponse, so we can reuse it.
typedef GeneratedTrack = JamendoTrackResponse;
