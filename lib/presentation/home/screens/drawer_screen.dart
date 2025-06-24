import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../quiz/screens/quiz_screen.dart';
import 'category_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildCategoryList(context)),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(Icons.menu_book, size: 50, color: Colors.white),
            Image.asset("assets/logos/logo.png", width: 150, height: 80),
            const SizedBox(height: 10),
            Text(
              'Lelo Quiz Biblique',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Apprenez en jouant',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final levels = ['beginner', 'intermediate', 'advanced', 'expert'];

    return FutureBuilder<List<Category>>(
      future: _fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }

        final categories = snapshot.data ?? [];

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'PAR NIVEAU DE DIFFICULTÉ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            ...levels.map((level) => _buildLevelTile(context, level)).toList(),
            const Divider(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'PAR CATÉGORIE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            ..._buildCategoryExpansionTiles(context, categories),
          ],
        );
      },
    );
  }

  Widget _buildLevelTile(BuildContext context, String level) {
    final levelName =
        {
          'beginner': 'Débutant',
          'intermediate': 'Intermédiaire',
          'advanced': 'Avancé',
          'expert': 'Expert',
        }[level] ??
        level;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _getLevelColor(level).withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(_getLevelIcon(level), color: _getLevelColor(level)),
      ),
      title: Text(levelName),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(level: level),
          ),
        );
      },
    );
  }

  List<Widget> _buildCategoryExpansionTiles(
    BuildContext context,
    List<Category> categories,
  ) {
    final levels = ['beginner', 'intermediate', 'advanced', 'expert'];

    return levels.map((level) {
      final levelCategories =
          categories.where((c) => c.level == level).toList();
      if (levelCategories.isEmpty) return const SizedBox.shrink();

      return ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _getLevelColor(level).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(_getLevelIcon(level), color: _getLevelColor(level)),
        ),
        title: Text(
          {
                'beginner': 'Débutant',
                'intermediate': 'Intermédiaire',
                'advanced': 'Avancé',
                'expert': 'Expert',
              }[level] ??
              level.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children:
            levelCategories
                .map((category) => _buildCategoryTile(context, category))
                .toList(),
      );
    }).toList();
  }

  Widget _buildCategoryTile(BuildContext context, Category category) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(56, 0, 16, 0),
      leading: Text(category.emoji, style: const TextStyle(fontSize: 20)),
      title: Text(category.name),
      trailing: const Icon(Icons.chevron_right, size: 16),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(category: category),
          ),
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        _buildSettingsTile(context),
        _buildAboutTile(context),
      ],
    );
  }

  Widget _buildSettingsTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings_outlined, size: 22),
      title: const Text('Paramètres'),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: () {
        Navigator.pop(context);
        _showSettingsDialog(context);
      },
    );
  }

  Widget _buildAboutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline, size: 22),
      title: const Text('À propos'),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: () {
        Navigator.pop(context);
        _showAboutDialog(context);
      },
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Paramètres'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSettingsSwitch(
                    title: 'Notifications',
                    value: true,
                    onChanged: (v) {},
                  ),
                  _buildSettingsSwitch(
                    title: 'Son des questions',
                    value: true,
                    onChanged: (v) {},
                  ),
                  _buildSettingsSwitch(
                    title: 'Vibrations',
                    value: false,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Temps par question',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: 30,
                    min: 10,
                    max: 60,
                    divisions: 5,
                    label: '30 secondes',
                    onChanged: (v) {},
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fermer'),
              ),
              TextButton(
                onPressed: () {
                  // Sauvegarder les paramètres
                  Navigator.pop(context);
                },
                child: const Text('Sauvegarder'),
              ),
            ],
          ),
    );
  }

  Widget _buildSettingsSwitch({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.info, color: Colors.blue),
                SizedBox(width: 10),
                Text('À propos'),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Lelo Quiz Biblique',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text('Version 1.0.0'),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Application éducative pour apprendre la Bible de manière ludique à travers des quiz.',
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Développé par',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('Lelo Dev Team'),
                  const SizedBox(height: 15),
                  const Text(
                    'Contact',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('contact@leloquiz.com'),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Ouvrir les conditions d'utilisation
                      },
                      child: const Text('Conditions d\'utilisation'),
                    ),
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

  Color _getLevelColor(String level) {
    switch (level) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return Colors.blue;
      case 'advanced':
        return Colors.orange;
      case 'expert':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getLevelIcon(String level) {
    switch (level) {
      case 'beginner':
        return Icons.flag;
      case 'intermediate':
        return Icons.trending_up;
      case 'advanced':
        return Icons.star;
      case 'expert':
        return Icons.verified;
      default:
        return Icons.help;
    }
  }

  Future<List<Category>> _fetchCategories() async {
    // Implémentez votre logique de récupération ici
    return [];
  }
}
