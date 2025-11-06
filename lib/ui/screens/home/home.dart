import 'package:audiomancy_flutter/ui/screens/home/widgets/categorybloc.dart';
import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';

import 'package:audiomancy_flutter/core/services/daily_categories.service.dart';
import 'package:audiomancy_flutter/data/models/category_item.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  'Catégories du jour',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mood',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaylistScreen(jsonFile: category.id), // A MODIFIER POUR LIEN PLAYLIST
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Activités',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaylistScreen(jsonFile: category.id), // A MODIFIER POUR LIEN PLAYLIST
                                ),
                              );
                            },
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
