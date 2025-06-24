import 'package:flutter/material.dart';

import 'quiz_controller.dart';

class ScoreDisplay extends StatelessWidget {
  final QuizController controller;

  const ScoreDisplay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          _buildScoreItem(
            icon: Icons.emoji_events,
            value: controller.highScore,
            color: Colors.amber.shade800,
          ),
          const SizedBox(width: 16),
          _buildScoreItem(
            icon: Icons.score,
            value: controller.score,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem({
    required IconData icon,
    required int value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(width: 4),
        Text(
          '$value',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
