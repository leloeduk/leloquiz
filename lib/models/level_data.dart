import 'category_model.dart';

class LevelData {
  final String level;
  final String description;
  final String biblicalReference;
  final String needs;
  final List<Category> categories;

  LevelData({
    required this.level,
    required this.description,
    required this.biblicalReference,
    required this.needs,
    required this.categories,
  });

  factory LevelData.fromJson(Map<String, dynamic> json) {
    return LevelData(
      level: json['level'],
      description: json['description'],
      biblicalReference: json['biblicalReference'],
      needs: json['needs'],
      categories:
          (json['categories'] as List)
              .map((cat) => Category.fromJson(cat))
              .toList(),
    );
  }
}
