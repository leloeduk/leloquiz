import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../models/level_data.dart';

class CategoryService {
  static Future<LevelData> loadLevelData(String level) async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/$level.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return LevelData.fromJson(jsonMap);
  }
}
