import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Nom des routes (constants)
  static const String playlist = '/playlist';

  // Fonction pour récupérer toutes les routes
  static Map<String, WidgetBuilder> routes = {
    playlist: (context) => PlaylistScreen(),
  };

  // Exemple : navigation simple
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
