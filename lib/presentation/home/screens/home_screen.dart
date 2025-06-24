import 'package:flutter/material.dart';
import 'package:leloquiz/presentation/home/screens/drawer_screen.dart';

import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> levels = [
      {
        'name': 'Débutant',
        'level': 'beginner',
        'color': Colors.blue,
        'emoji': '🌱',
      },
      {
        'name': 'Intermédiaire',
        'level': 'intermediate',
        'color': Colors.green,
        'emoji': '🌿',
      },
      {
        'name': 'Avancé',
        'level': 'advanced',
        'color': Colors.orange,
        'emoji': '🌲',
      },
      {'name': 'Expert', 'level': 'expert', 'color': Colors.red, 'emoji': '🏆'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lelo Quiz Biblique"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Afficher les informations sur l'app
            },
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choisissez votre niveau:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  final level = levels[index];
                  return _LevelCard(
                    name: level['name'],
                    level: level['level'],
                    color: level['color'],
                    emoji: level['emoji'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final String name;
  final String level;
  final Color color;
  final String emoji;

  const _LevelCard({
    required this.name,
    required this.level,
    required this.color,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CategoriesScreen(level: level)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.8), color.withOpacity(0.4)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
