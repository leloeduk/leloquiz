import 'package:flutter/material.dart';
import '../../models/badget_model.dart';
import '../../models/category_model.dart';
import '../quiz/screens/quiz_screen.dart';
import '../quiz/screens/widgets/badget_controller.dart';

class CategoryScreen extends StatelessWidget {
  final String level; // Niveau de la catégorie

  CategoryScreen({super.key, required this.level});

  // Liste des catégories (à remplacer par tes vraies données)
  final List<Category> categories = [
    Category(
      id: '1',
      name: 'Science',
      emoji: '🔬',
      level: 'Facile',
      questions: [],
    ),
    Category(
      id: '2',
      name: 'Math',
      emoji: '🧮',
      level: 'Facile',
      questions: [],
    ),
    Category(
      id: '3',
      name: 'Histoire',
      emoji: '📜',
      level: 'Moyen',
      questions: [],
    ),
    Category(
      id: '4',
      name: 'Géographie',
      emoji: '🌍',
      level: 'Difficile',
      questions: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCategories =
        categories.where((category) => category.level == level).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories - $level'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child:
            filteredCategories.isEmpty
                ? Center(
                  child: Text("Aucune catégorie trouvée pour ce niveau."),
                )
                : ListView.builder(
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = filteredCategories[index];
                    return Stack(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: Text(
                              category.emoji,
                              style: TextStyle(fontSize: 30),
                            ),
                            title: Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => QuizScreen(category: category),
                                ),
                              );
                            },
                          ),
                        ),
                        if (category.isCompleted)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: BadgeIcon(
                              badge: Badget(
                                id: 'completed',
                                emoji: '✅',
                                description: 'Catégorie complétée',
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
      ),
    );
  }
}
