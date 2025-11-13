import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:audiomancy_flutter/data/models/generated_track.dart';

class ApiProvider {
  final String? _apiKey = dotenv.env['API_KEY'];
  final String _baseUrl = 'http://127.0.0.1:8000'; // Assuming the backend is running locally

  Future<List<GeneratedTrack>> generatePlaylist(String prompt, int limit) async {
    if (_apiKey == null) {
      throw Exception('API_KEY not found in .env file');
    }

    final response = await http.post(
      Uri.parse('$_baseUrl/generate/playlist'),
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': _apiKey,
      },
      body: jsonEncode({
        'prompt': prompt,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => GeneratedTrack.fromJson(json)).toList();
    } else {
      throw Exception('Failed to generate playlist: ${response.body}');
    }
  }
}
