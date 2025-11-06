import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/category_item.model.dart';

class CategoryService {
  static Future<Map<String, List<CategoryItem>>> loadAllCategories() async {
    final String response =
        await rootBundle.loadString('assets/categories/categories.json');
    final data = json.decode(response);

    final Map<String, List<CategoryItem>> allCategories = {};

    data['categories'].forEach((key, value) {
      final List<CategoryItem> items = (value as List)
          .map((json) => CategoryItem.fromJson(json))
          .toList();
      allCategories[key] = items;
    });

    return allCategories;
  }
}