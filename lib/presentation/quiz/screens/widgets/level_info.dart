// ────────────────
// Widget pour afficher les informations de niveau
// ────────────────

import 'package:flutter/material.dart';

import '../../../../models/quiz_model.dart';

class LevelInfo extends StatelessWidget {
  final QuizLevel level;

  const LevelInfo({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Niveau: ${level.toString().split('.').last.toUpperCase()}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(level.description, style: const TextStyle(fontSize: 14)),
          Text(
            'Référence: ${level.biblicalReference}',
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
