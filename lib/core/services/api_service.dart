import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:audiomancy_flutter/data/models/track.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// Exception personnalisée pour les erreurs d'API.
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? body;

  ApiException({required this.message, this.statusCode, this.body});

  @override
  String toString() {
    return 'ApiException: $message (Status Code: $statusCode)';
  }
}

class ApiService {
  // Utilisation d'un client HTTP unique pour la réutilisation des connexions.
  final http.Client _client;

  // Les configurations sont maintenant des membres de la classe, initialisés une seule fois.
  final String _baseUrl;
  final String _apiKey;

  // Constructeur privé utilisé par le factory.
  ApiService._({
    required http.Client client,
    required String baseUrl,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  // Le constructeur factory gère la logique d'initialisation complexe.
  factory ApiService({http.Client? client}) {
    // On charge la configuration depuis .env une seule fois.
    // Pour l'émulateur Android, l'hôte local (localhost) est accessible via 10.0.2.2
    final androidUrl = dotenv.env['API_BASE_URL_ANDROID'] ?? 'http://10.0.2.2:8000';
    final defaultUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8000';
    final baseUrl = Platform.isAndroid ? androidUrl : defaultUrl;

    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API_KEY non trouvée ou vide dans le fichier .env');
    }

    return ApiService._(client: client ?? http.Client(), baseUrl: baseUrl, apiKey: apiKey);
  }

  /// Génère une playlist en envoyant des tags à l'API.
  ///
  /// [tags] est une chaîne de caractères contenant les tags séparés par des espaces.
  /// Retourne une liste d'objets [Track].
  /// Lève une [ApiException] en cas d'échec.
  Future<List<Track>> generatePlaylist(String tags, int trackCount) async {
    final url = Uri.parse('$_baseUrl/generate/playlist?limit=$trackCount');

    try {
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'X-API-Key': _apiKey, // En-tête pour l'authentification
        },
        body: jsonEncode(<String, String>{
          'tags': tags,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson.map((json) => Track.fromJson(json)).toList();
      } else {
        // Lève notre exception personnalisée avec plus de détails.
        throw ApiException(
          message: 'Échec de la génération de la playlist',
          statusCode: response.statusCode,
          body: response.body,
        );
      }
    } on SocketException catch (e) {
      throw ApiException(message: 'Erreur réseau: impossible de joindre le serveur. $e');
    } on TimeoutException catch (e) {
      throw ApiException(message: 'La requête a expiré (timeout). $e');
    } on ApiException {
      rethrow; // On propage notre exception personnalisée.
    } catch (e) {
      // Pour toute autre erreur inattendue.
      throw ApiException(message: 'Une erreur inattendue est survenue: $e');
    }
  }
}