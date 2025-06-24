// /**
//  * Modèle représentant une catégorie de questions
//  * - id : Identifiant unique (ex: "genesis")
//  * - name : Nom affiché (ex: "Genèse")
//  * - emoji : Icône visuelle (ex: "🌍")
//  * - questions : Liste des questions de cette catégorie
//  */
// Modèle d'une catégorie de quiz intégrant le niveau de maturité spirituelle
import 'question_model.dart';

class Category {
  final String id;
  final String name;
  final String emoji;
  final String level;
  final List<Question> questions;
  bool isCompleted;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
    required this.questions,
    required this.level,
    this.isCompleted = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],

      emoji: json['emoji'],
      level: json['level'],
      questions:
          (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }
}
