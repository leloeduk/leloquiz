// Créez widgets/badge_icon.dart
import 'package:flutter/material.dart';
import 'package:leloquiz/models/badget_model.dart';

class BadgeIcon extends StatelessWidget {
  final Badget badge;

  const BadgeIcon({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: badge.description,
      child: Text(badge.emoji, style: const TextStyle(fontSize: 24)),
    );
  }
}
