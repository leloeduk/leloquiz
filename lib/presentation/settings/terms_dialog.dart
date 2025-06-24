import 'package:flutter/material.dart';

void showTermsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Conditions d\'utilisation'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSectionTitle('1. Acceptation des conditions'),
                _buildSectionText(
                  'En utilisant cette application, vous acceptez ces conditions.',
                ),

                _buildSectionTitle('2. Utilisation autorisée'),
                _buildSectionText(
                  'Cette application est destinée à un usage personnel et éducatif.',
                ),

                _buildSectionTitle('3. Contenu'),
                _buildSectionText(
                  'Le contenu biblique est fourni à titre informatif uniquement.',
                ),

                _buildSectionTitle('4. Vie privée'),
                _buildSectionText(
                  'Nous respectons votre vie privée. Consultez notre politique de confidentialité.',
                ),

                _buildSectionTitle('5. Modifications'),
                _buildSectionText(
                  'Nous pouvons modifier ces conditions à tout moment.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        ),
  );
}

Widget _buildSectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 4),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

Widget _buildSectionText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontSize: 14)),
  );
}
