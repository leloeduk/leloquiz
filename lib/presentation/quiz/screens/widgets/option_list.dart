// ────────────────
// Widget pour afficher la liste des options de réponse
// ────────────────

import 'package:flutter/material.dart';

class OptionsList extends StatelessWidget {
  final List<String> options;
  final Function(int)? onOptionSelected;
  final Color Function(int) getOptionColor;
  final bool showFeedback;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;

  const OptionsList({
    super.key,
    required this.options,
    this.onOptionSelected,
    required this.getOptionColor,
    this.showFeedback = false,
    this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        final isCorrect = index == correctAnswerIndex;
        final isSelected = index == selectedAnswerIndex;
        final isWrongSelected = showFeedback && isSelected && !isCorrect;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: getOptionColor(index),
              borderRadius: BorderRadius.circular(12),
              boxShadow:
                  showFeedback
                      ? [
                        BoxShadow(
                          color:
                              isCorrect
                                  ? Colors.green.shade800
                                  : isWrongSelected
                                  ? Colors.red.shade800
                                  : Colors.transparent,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ]
                      : null,
            ),
            child: ListTile(
              title: Text(
                options[index],
                style: TextStyle(
                  color:
                      showFeedback && isCorrect ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              onTap:
                  onOptionSelected != null
                      ? () => onOptionSelected!(index)
                      : null,
            ),
          ),
        );
      },
    );
  }
}
