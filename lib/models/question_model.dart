// /**
//  * Modèle représentant une question individuelle
//  * - id : Identifiant unique (ex: "g1")
//  * - text : Énoncé de la question
//  * - options : Liste des choix possibles
//  * - correctIndex : Index de la bonne réponse
//  * - reference : Référence biblique (ex: "Genèse 1:1")
//  */
class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String reference;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.reference,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      options: List<String>.from(json['options']),
      correctIndex: json['correctIndex'],
      reference: json['reference'],
    );
  }
}
