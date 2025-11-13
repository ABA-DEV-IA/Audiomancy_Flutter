import 'package:audiomancy_flutter/data/models/track.dart';
import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Nom des routes (constants)
  static const String playlist = '/playlist';
  // Ajoutez d'autres noms de routes ici, ex: static const String home = '/';

  /// Génère les routes de l'application. À utiliser avec `onGenerateRoute` dans MaterialApp.
  /// Cela permet de passer des arguments aux routes de manière sécurisée.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case playlist:
        // Vérifie que les arguments sont du bon type (List<Track>)
        if (settings.arguments is List<Track>) {
          final playlistData = settings.arguments as List<Track>;
          return MaterialPageRoute(
            builder: (context) => PlaylistScreen(playlist: playlistData),
          );
        }
        // Si les arguments ne sont pas bons, on retourne une page d'erreur.
        return _errorRoute('Arguments invalides pour la route playlist.');

      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        // Si la route n'est pas trouvée
        return _errorRoute('Route non trouvée: ${settings.name}');
    }
  }

  /// Crée une page d'erreur standard.
  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(child: Text('ERREUR : $message')),
      );
    });
  }
}
