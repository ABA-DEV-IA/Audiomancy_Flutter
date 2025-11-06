import 'package:audiomancy_flutter/ui/screens/home/widgets/categorybloc.dart';
import 'package:audiomancy_flutter/ui/screens/player/playlist.dart';
import 'package:flutter/material.dart';
import 'package:audiomancy_flutter/core/services/allcategories.service.dart';
import 'package:audiomancy_flutter/data/models/category_item.model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = "";
  Map<String, List<CategoryItem>> _allCategories = {};
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final data = await CategoryService.loadAllCategories();
      setState(() {
        _allCategories = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
                ? Center(child: Text('Erreur : $_errorMessage'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Barre de recherche
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher une catégorie',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value.toLowerCase();
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Liste filtrée
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildFilteredCategories(),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  List<Widget> _buildFilteredCategories() {
    final List<Widget> widgets = [];

    _allCategories.forEach((categoryType, categories) {
      final filtered = categories.where((cat) {
        final query = _searchQuery.trim();
        if (query.isEmpty) return true;
        return cat.title.toLowerCase().contains(query) ||
            cat.description.toLowerCase().contains(query);
      }).toList();

      if (filtered.isEmpty) return;

      widgets.addAll(filtered.map((category) {
        return CategoryBlocWidget(
          category_name: category.title,
          description: category.description,
          image_path: category.image,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaylistScreen(jsonFile: category.id),
              ),
            );
          },
        );
      }).toList());
    });

    if (widgets.isEmpty) {
      widgets.add(const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Text('Aucun résultat trouvé.'),
        ),
      ));
    }

    return widgets;
  }
}