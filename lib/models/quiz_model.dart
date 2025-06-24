// Définition des niveaux de maturité spirituelle
enum QuizLevel {
  beginner, // Débutant
  intermediate, // Moyen
  advanced, // Difficile
  expert, // Expert
}

// Extension pour associer des propriétés à chaque niveau
extension QuizLevelExtension on QuizLevel {
  String get description {
    switch (this) {
      case QuizLevel.beginner:
        return "Nouveaux croyants apprenant les bases de la foi chrétienne.";
      case QuizLevel.intermediate:
        return "Approfondissement de la compréhension des Écritures et application des principes bibliques.";
      case QuizLevel.advanced:
        return "Engagement actif dans le service et le ministère, enseignement aux autres.";
      case QuizLevel.expert:
        return "Leaders spirituels matures formant d'autres croyants, vie de prière active.";
    }
  }

  String get biblicalReference {
    switch (this) {
      case QuizLevel.beginner:
        return "Hébreux 5:12-14";
      case QuizLevel.intermediate:
        return "1 Corinthiens 3:1-3";
      case QuizLevel.advanced:
        return "Matthieu 28:19-20";
      case QuizLevel.expert:
        return "2 Timothée 2:2";
    }
  }

  String get needs {
    switch (this) {
      case QuizLevel.beginner:
        return "Enseignements simples et clairs pour établir une fondation solide.";
      case QuizLevel.intermediate:
        return "Enseignements plus approfondis et défis pour continuer à grandir spirituellement.";
      case QuizLevel.advanced:
        return "Formation continue, mentorat, et soutien pour surmonter les défis du ministère.";
      case QuizLevel.expert:
        return "Approfondissement de la relation avec Dieu, humilité, et croissance continue dans la foi.";
    }
  }
}
