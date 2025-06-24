// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class DrawerFooterSection extends StatelessWidget {
//   const DrawerFooterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Divider(height: 1),
//         _buildShareTile(context),
//         _buildSettingsTile(context),
//         _buildAboutTile(context),
//         _buildTermsTile(context),
//       ],
//     );
//   }

//   Widget _buildShareTile(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.share, size: 22),
//       title: const Text('Partager l\'application'),
//       onTap: () => _shareApp(context),
//     );
//   }

//   Widget _buildSettingsTile(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.settings_outlined, size: 22),
//       title: const Text('Paramètres'),
//       onTap: () => showSettingsDialog(context),
//     );
//   }

//   Widget _buildAboutTile(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.info_outline, size: 22),
//       title: const Text('À propos'),
//       onTap: () => showAboutDialog(context),
//     );
//   }

//   Widget _buildTermsTile(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.description_outlined, size: 22),
//       title: const Text('Conditions d\'utilisation'),
//       onTap: () => showTermsDialog(context),
//     );
//   }

//   void _shareApp(BuildContext context) {
//     Share.share(
//       'Découvrez Lelo Quiz Biblique - Une application géniale pour apprendre la Bible !',
//       subject: 'Lelo Quiz Biblique',
//     );
//   }
// }
