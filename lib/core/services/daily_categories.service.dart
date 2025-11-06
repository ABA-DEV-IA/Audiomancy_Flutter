import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/category_item.model.dart';

class CategoryService {
  static Future<List<CategoryItem>> loadCategories(String type) async {
    final String response =
        await rootBundle.loadString('assets/categories/categories_du_jour.json');

    final data = json.decode(response);

    final List items = data['categories'][type];

    return items.map((json) => CategoryItem.fromJson(json)).toList();
  }
}