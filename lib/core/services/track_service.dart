import 'dart:convert';
import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:flutter/services.dart' show rootBundle;

class TrackService {
  /// Charge les pistes depuis :
  /// - un fichier dans assets/json/ (si [fileName] est fourni)
  /// - un contenu JSON brut (si [jsonContent] est fourni)
  static Future<List<Track>> loadTracks({
    String? fileName,
    String? jsonContent,
  }) async {
    if (jsonContent != null) {
      // cas 1: on fournit le JSON brut
      final List<dynamic> jsonList = jsonDecode(jsonContent);
      return jsonList.map((e) => Track.fromJson(e)).toList();
    }

    if (fileName != null) {
      // cas 2 : on fournit juste le nom du fichier
      final path = 'assets/json/$fileName.json';
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => Track.fromJson(e)).toList();
    }

    // cas 3 : rien fourni → erreur explicite
    throw ArgumentError('Vous devez fournir soit fileName, soit jsonContent.');
  }
}