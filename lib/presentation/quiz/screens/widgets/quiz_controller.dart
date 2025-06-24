import 'package:flutter/material.dart';
import 'package:leloquiz/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizController {
  final Category category;
  int currentIndex = 0;
  int score = 0;
  int highScore = 0;
  bool showFeedback = false;
  int? selectedAnswer;
  List<int?> userAnswers = [];

  QuizController(this.category);

  Future<void> loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    highScore = prefs.getInt('${category.id}_highScore') ?? 0;
  }

  Future<void> saveHighScore() async {
    if (score > highScore) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('${category.id}_highScore', score);
      highScore = score;
    }
    if (score == category.questions.length * 10) {
      category.isCompleted = true;
    }
  }

  void handleAnswer(int selectedIndex) {
    showFeedback = true;
    selectedAnswer = selectedIndex;

    if (selectedIndex == category.questions[currentIndex].correctIndex) {
      score += 10;
    }
    userAnswers.add(selectedIndex);
  }

  void moveToNextQuestion() {
    showFeedback = false;
    selectedAnswer = null;
    currentIndex++;
  }

  bool get isComplete => currentIndex >= category.questions.length;

  Color getOptionColor(int index) {
    if (!showFeedback) return Colors.amber.shade800;
    if (index == category.questions[currentIndex].correctIndex)
      return Colors.green;
    if (index == selectedAnswer) return Colors.red;
    return Colors.red.shade300;
  }
}
