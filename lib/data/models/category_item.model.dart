class CategoryItem {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final String id;
  final List<String> tags;

  CategoryItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.id,
    required this.tags,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    String imagePath = json['image'];
    if (imagePath.startsWith('/')) {
      imagePath = 'assets$imagePath';
    }
    
    return CategoryItem(
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      image: imagePath,
      id: json['id'],
      tags: json['tags'].toString().split(" "),
    );
  }
}