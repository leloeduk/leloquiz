import 'package:flutter/material.dart';

import '../../../../models/question_model.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final bool isNewRecord;
  final List<Question> questions; // Ajoutez ceci
  final List<int?> userAnswers;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.isNewRecord,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Résultats')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade500,
              Colors.blue.shade200,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.widgets, size: 100),
                Text(
                  'Score final: $score/${totalQuestions * 10}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                if (isNewRecord) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Nouveau record ! 🎉',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                const SizedBox(height: 30),
                LinearProgressIndicator(
                  value: score / (totalQuestions * 10),
                  backgroundColor: Colors.black,
                  color: Colors.green.shade800,
                  minHeight: 15,
                ),
                const SizedBox(height: 40),
                if (score < totalQuestions * 10) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Questions à revoir:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        if (userAnswers[index] ==
                            questions[index].correctIndex) {
                          return const SizedBox();
                        }
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questions[index].text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Votre réponse: ${questions[index].options[userAnswers[index]!]}',
                                  style: TextStyle(color: Colors.red.shade700),
                                ),
                                Text(
                                  'Bonne réponse: ${questions[index].options[questions[index].correctIndex]}',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ] else ...[
                  const Spacer(),
                  const Text(
                    'Félicitations! Vous avez tout réussi!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Spacer(),
                ],
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Retour à l\'accueil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
