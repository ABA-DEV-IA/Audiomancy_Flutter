import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audiomancy_flutter/core/constants/api_constants.dart';
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/data/models/playlist.dart';

class ApiService {
  final String _baseUrl = ApiConstants.BASE_URL;
  final String _apiKey = ApiConstants.API_KEY;

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'X-API-Key': _apiKey,
    };
  }

  Future<List<Track>> searchJamendoTracks(String query, {int limit = 10, int offset = 0}) async {
    final uri = Uri.parse('$_baseUrl/jamendo/tracks').replace(queryParameters: {
      'query': query,
      'limit': limit.toString(),
      'offset': offset.toString(),
    });

    final response = await http.get(uri, headers: _getHeaders());

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Track.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Jamendo tracks: ${response.statusCode} ${response.body}');
    }
  }

  Future<Playlist> generatePlaylist(PlaylistGenerationRequest request) async {
    final uri = Uri.parse('$_baseUrl/generate/playlist');
    final response = await http.post(
      uri,
      headers: _getHeaders(),
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return Playlist.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to generate playlist: ${response.statusCode} ${response.body}');
    }
  }
}
