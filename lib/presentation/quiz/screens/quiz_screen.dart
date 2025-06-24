import 'package:flutter/material.dart';
import 'package:leloquiz/presentation/quiz/screens/widgets/badget_controller.dart';

import '../../../models/badget_model.dart';
import '../../../models/category_model.dart';
import '../functions/count_down_timer.dart';
import 'widgets/option_list.dart';
import 'widgets/question_card.dart';
import 'widgets/quiz_controller.dart';
import 'widgets/result_screen.dart';
import 'widgets/score_display.dart';

class QuizScreen extends StatefulWidget {
  final Category category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuizController(widget.category);
    _initializeQuiz();
  }

  Future<void> _initializeQuiz() async {
    await _controller.loadHighScore();
    if (mounted) setState(() {});
  }

  void _handleAnswer(int selectedIndex) {
    setState(() => _controller.handleAnswer(selectedIndex));

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => _controller.moveToNextQuestion());

      if (_controller.isComplete) {
        _showResults();
      }
    });
  }

  void _showResults() {
    _controller.saveHighScore().then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (_) => ResultsScreen(
                score: _controller.score,
                totalQuestions: widget.category.questions.length,
                isNewRecord: _controller.score > _controller.highScore,
                questions: widget.category.questions, // Ajoutez ceci
                userAnswers: _controller.userAnswers,
              ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isComplete) {
      return const Center(child: CircularProgressIndicator());
    }

    final question = widget.category.questions[_controller.currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          ScoreDisplay(controller: _controller),
          if (widget.category.isCompleted)
            BadgeIcon(
              badge: Badget(
                id: 'completed',
                emoji: '🏆',
                description: 'Catégorie complétée à 100%',
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CountdownTimer(
              key: ValueKey(question.id),
              duration: 50,
              onTimerComplete: () {
                if (!_controller.showFeedback) {
                  setState(() => _controller.showFeedback = true);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() => _controller.moveToNextQuestion());
                      if (_controller.isComplete) _showResults();
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            QuestionCard(question: question),
            const SizedBox(height: 20),
            Expanded(
              child: OptionsList(
                options: question.options,
                onOptionSelected:
                    _controller.showFeedback ? null : _handleAnswer,
                getOptionColor: _controller.getOptionColor,
                showFeedback: _controller.showFeedback,
                correctAnswerIndex: question.correctIndex,
                selectedAnswerIndex: _controller.selectedAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
