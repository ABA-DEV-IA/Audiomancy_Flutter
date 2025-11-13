import 'package:audiomancy_flutter/ui/screens/home/widgets/categorybloc.dart';
import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/core/services/api_service.dart';

import 'package:audiomancy_flutter/core/services/daily_categories.service.dart';
import 'package:audiomancy_flutter/data/models/category_item.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  Future<void> _generateAndPlay(CategoryItem category) async {
    if (_isLoading) return; // Empêche les clics multiples

    setState(() => _isLoading = true);

    // Affiche une boîte de dialogue de chargement modale
    showDialog(
      context: context,
      barrierDismissible: false, // L'utilisateur ne peut pas fermer la boîte de dialogue
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Génération en cours..."),
              ],
            ),
          ),
        );
      },
    );

    try {
      // Appelle l'API pour générer la playlist avec les tags de la catégorie
      final playlist = await _apiService.generatePlaylist(category.tags.join(' '), 15); // On joint la liste de tags en une seule chaîne

      if (!mounted) return; // Vérifie si le widget est toujours monté
      Navigator.of(context).pop(); // Ferme la boîte de dialogue de chargement

      // Navigue vers l'écran de la playlist avec les pistes générées
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlaylistScreen(playlist: playlist)),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop(); // Ferme la boîte de dialogue de chargement
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur de génération'),
          content: Text('Impossible de générer la playlist.\n\nDétails: ${e.message}'),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
        ),
      );
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔮 Audiomancy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  '----- Mood -----',
                  style: TextStyle(fontSize: 24),
                ),
                FutureBuilder<List<CategoryItem>>(
                  future: CategoryService.loadCategories('mood'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final categories = snapshot.data!;
                      return Column(
                        children: categories.map((category) {
                          return CategoryBlocWidget(
                            category_name: category.title,
                            description: category.description,
                            image_path: category.image,
                            onTap: () => _generateAndPlay(category),
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '----- Activités -----',
                  style: TextStyle(fontSize: 24),
                ),

                FutureBuilder<List<CategoryItem>>(
                  future: CategoryService.loadCategories('activity'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final categories = snapshot.data!;
                      return Column(
                        children: categories.map((category) {
                          return CategoryBlocWidget(
                            category_name: category.title,
                            description: category.description,
                            image_path: category.image,
                            onTap: () => _generateAndPlay(category),
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
