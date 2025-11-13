import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audiomancy_flutter/data/models/jamendo_models.dart';
import 'package:audiomancy_flutter/data/models/ai_models.dart';

class ApiService {
  final String _baseUrl = "http://127.0.0.1:8000"; // Assuming backend runs on localhost:8000

  Future<List<JamendoTrackResponse>> getJamendoTracks(
      JamendoTrackRequest request) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/jamendo/tracks'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<JamendoTrackResponse>.from(
          l.map((model) => JamendoTrackResponse.fromJson(model)));
    } else {
      throw Exception('Failed to load Jamendo tracks');
    }
  }

  Future<List<GeneratedTrack>> generatePlaylist(PromptRequest request) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/generate/playlist'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<GeneratedTrack>.from(
          l.map((model) => GeneratedTrack.fromJson(model)));
    } else {
      throw Exception('Failed to generate playlist');
    }
  }
}
