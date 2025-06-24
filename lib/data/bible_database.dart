// import 'package:leloquiz/models/question_model.dart';

// import '../models/category_model.dart';

// class BibleDatabase {
//   static final List<Category> allCategories = [
//     // Catégorie 1: Genèse
//     Category(
//       id: "genesis",
//       name: "Genèse",
//       emoji: "🌍",
//       questions: [
//         Question(
//           id: "g1",
//           text: "Qu'a créé Dieu le premier jour ?",
//           options: ["La lumière", "Les cieux", "La terre", "Les animaux"],
//           correctIndex: 0,
//           reference: "Genèse 1:3-5",
//         ),
//         Question(
//           id: "g2",
//           text: "Comment s'appelait le premier jardin ?",
//           options: ["Gethsémané", "Eden", "Oliviers", "Paradis"],
//           correctIndex: 1,
//           reference: "Genèse 2:8",
//         ),
//         Question(
//           id: "g3",
//           text: "Qui était la femme de Caïn ?",
//           options: [
//             "Une fille d'Adam",
//             "Une cananéenne",
//             "La Bible ne dit pas",
//             "Lilith",
//           ],
//           correctIndex: 2,
//           reference: "Genèse 4:17",
//         ),
//         Question(
//           id: "g4",
//           text:
//               "Combien d'animaux de chaque espèce Noé a-t-il pris dans l'arche ?",
//           options: ["1", "2", "7", "14"],
//           correctIndex: 1,
//           reference: "Genèse 6:19-20",
//         ),
//         Question(
//           id: "g5",
//           text: "Quel signe Dieu donna-t-il après le déluge ?",
//           options: ["Une colombe", "Un rameau", "Un arc-en-ciel", "Une étoile"],
//           correctIndex: 2,
//           reference: "Genèse 9:13",
//         ),
//         Question(
//           id: "g6",
//           text: "Quelle tour célèbre est mentionnée en Genèse ?",
//           options: [
//             "Tour de David",
//             "Tour de Jéricho",
//             "Tour de Babel",
//             "Tour de Sichem",
//           ],
//           correctIndex: 2,
//           reference: "Genèse 11:4",
//         ),
//         Question(
//           id: "g7",
//           text: "Quel âge avait Abraham quand il quitta Haran ?",
//           options: ["65 ans", "75 ans", "100 ans", "120 ans"],
//           correctIndex: 1,
//           reference: "Genèse 12:4",
//         ),
//         Question(
//           id: "g8",
//           text: "Qui était le neveu d'Abraham ?",
//           options: ["Lot", "Isaac", "Jacob", "Ésaü"],
//           correctIndex: 0,
//           reference: "Genèse 12:5",
//         ),
//         Question(
//           id: "g9",
//           text: "Combien de fils eut Jacob ?",
//           options: ["7", "10", "12", "15"],
//           correctIndex: 2,
//           reference: "Genèse 35:22-26",
//         ),
//         Question(
//           id: "g10",
//           text: "Qui vendit Joseph comme esclave ?",
//           options: [
//             "Ses frères",
//             "Les Égyptiens",
//             "Les Madianites",
//             "Les Philistins",
//           ],
//           correctIndex: 0,
//           reference: "Genèse 37:28",
//         ),
//         Question(
//           id: "g11",
//           text: "Quel rêve Joseph interpréta en prison ?",
//           options: [
//             "Le songe du pharaon",
//             "Le songe du boulanger",
//             "Le songe de l'échanson",
//             "Le songe des étoiles",
//           ],
//           correctIndex: 2,
//           reference: "Genèse 40:9-13",
//         ),
//         Question(
//           id: "g12",
//           text: "Combien d'années de famine Joseph prédit-il ?",
//           options: ["3 ans", "7 ans", "10 ans", "40 ans"],
//           correctIndex: 1,
//           reference: "Genèse 41:29-30",
//         ),
//         Question(
//           id: "g13",
//           text: "Qui fut le premier fils de Jacob à aller en Égypte ?",
//           options: ["Ruben", "Juda", "Benjamin", "Siméon"],
//           correctIndex: 0,
//           reference: "Genèse 42:3",
//         ),
//         Question(
//           id: "g14",
//           text: "Où Jacob mourut-il ?",
//           options: ["Canaan", "Égypte", "Haran", "Ur"],
//           correctIndex: 1,
//           reference: "Genèse 49:33",
//         ),
//         Question(
//           id: "g15",
//           text: "Où Joseph fut-il enterré ?",
//           options: ["Égypte", "Canaan", "Sichem", "Hébron"],
//           correctIndex: 0,
//           reference: "Genèse 50:26",
//         ),
//       ],
//     ),
//     Category(
//       id: "exodus",
//       name: "Exode",
//       emoji: "🌊",
//       questions: [
//         Question(
//           id: "e1",
//           text: "Combien de plaies Dieu envoya-t-il sur l'Égypte ?",
//           options: ["7", "10", "12", "40"],
//           correctIndex: 1,
//           reference: "Exode 7-12",
//         ),
//         Question(
//           id: "e2",
//           text: "Quel était le nom de la mère de Moïse ?",
//           options: ["Myriam", "Jokébed", "Séphora", "Débora"],
//           correctIndex: 1,
//           reference: "Exode 6:20",
//         ),
//         Question(
//           id: "e3",
//           text: "Quel buisson brûlait sans se consumer ?",
//           options: [
//             "Buisson de myrrhe",
//             "Buisson d'épines",
//             "Buisson de Sinaï",
//             "Buisson d'Horeb",
//           ],
//           correctIndex: 1,
//           reference: "Exode 3:2",
//         ),
//         Question(
//           id: "e4",
//           text: "Quel signe Dieu donna-t-il à Moïse pour prouver sa mission ?",
//           options: [
//             "La verge changée en serpent",
//             "La manne",
//             "Les plaies",
//             "La colonne de feu",
//           ],
//           correctIndex: 0,
//           reference: "Exode 4:1-5",
//         ),
//         Question(
//           id: "e5",
//           text: "Qui fut le pharaon de l'Exode ?",
//           options: [
//             "Ramsès II",
//             "Akhenaton",
//             "La Bible ne précise pas",
//             "Toutankhamon",
//           ],
//           correctIndex: 2,
//           reference: "Exode (non précisé)",
//         ),
//         Question(
//           id: "e6",
//           text: "Combien de commandements Dieu donna-t-il à Moïse ?",
//           options: ["7", "10", "12", "40"],
//           correctIndex: 1,
//           reference: "Exode 20:1-17",
//         ),
//         Question(
//           id: "e7",
//           text:
//               "Quel aliment miraculeux les Israélites reçurent-ils dans le désert ?",
//           options: ["La manne", "Les cailles", "Le miel", "Les dattes"],
//           correctIndex: 0,
//           reference: "Exode 16:14-15",
//         ),
//         Question(
//           id: "e8",
//           text: "Qui fabriqua le veau d'or ?",
//           options: ["Aaron", "Korah", "Josué", "Moïse"],
//           correctIndex: 0,
//           reference: "Exode 32:2-4",
//         ),
//         Question(
//           id: "e9",
//           text: "Combien de tables de la loi Moïse reçut-il ?",
//           options: ["1", "2", "10", "12"],
//           correctIndex: 1,
//           reference: "Exode 31:18",
//         ),
//         Question(
//           id: "e10",
//           text: "Quel était le matériau principal du Tabernacle ?",
//           options: ["Or", "Argent", "Bois d'acacia", "Peaux de bêtes"],
//           correctIndex: 2,
//           reference: "Exode 26:15",
//         ),
//         Question(
//           id: "e11",
//           text: "Qui fut le premier grand prêtre d'Israël ?",
//           options: ["Aaron", "Moïse", "Éléazar", "Melchisédek"],
//           correctIndex: 0,
//           reference: "Exode 28:1",
//         ),
//         Question(
//           id: "e12",
//           text: "Combien de jours dura la nuée sur le mont Sinaï ?",
//           options: ["7", "10", "40", "120"],
//           correctIndex: 2,
//           reference: "Exode 24:18",
//         ),
//         Question(
//           id: "e13",
//           text: "Quel objet contenait la manne conservée ?",
//           options: ["L'arche", "Le chandelier", "L'autel", "La cruche d'or"],
//           correctIndex: 0,
//           reference: "Exode 16:33-34",
//         ),
//         Question(
//           id: "e14",
//           text:
//               "Qui aida Moïse à soutenir ses mains pendant la bataille contre Amalek ?",
//           options: ["Aaron", "Hur", "Josué", "Myriam"],
//           correctIndex: 1,
//           reference: "Exode 17:12",
//         ),
//         Question(
//           id: "e15",
//           text:
//               "Quel métier exerçait Bezaleel, le constructeur du Tabernacle ?",
//           options: ["Forgeron", "Tisserand", "Sculpteur", "Tous ces métiers"],
//           correctIndex: 3,
//           reference: "Exode 35:30-35",
//         ),
//       ],
//     ),
//     Category(
//       id: "psalms",
//       name: "Psaumes",
//       emoji: "🎵",
//       questions: [
//         Question(
//           id: "p1",
//           text:
//               "Quel est le verset central de la Bible (en nombre de chapitres) ?",
//           options: [
//             "Psaume 117",
//             "Psaume 118:8",
//             "Psaume 119:105",
//             "Psaume 23:1",
//           ],
//           correctIndex: 1,
//           reference: "Psaume 118:8",
//         ),
//         Question(
//           id: "p2",
//           text: "Qui est l'auteur principal des Psaumes ?",
//           options: ["Salomon", "Moïse", "David", "Asaph"],
//           correctIndex: 2,
//           reference: "73 Psaumes attribués à David",
//         ),
//         Question(
//           id: "p3",
//           text: "Quel Psaume commence par 'L'Éternel est mon berger' ?",
//           options: ["Psaume 1", "Psaume 22", "Psaume 23", "Psaume 91"],
//           correctIndex: 2,
//           reference: "Psaume 23:1",
//         ),
//         Question(
//           id: "p4",
//           text: "Combien de Psaumes contient le livre ?",
//           options: ["50", "100", "150", "200"],
//           correctIndex: 2,
//           reference: "Livre des Psaumes",
//         ),
//         Question(
//           id: "p5",
//           text: "Quel Psaume contient 176 versets ?",
//           options: ["Psaume 1", "Psaume 22", "Psaume 119", "Psaume 150"],
//           correctIndex: 2,
//           reference: "Psaume 119",
//         ),
//         Question(
//           id: "p6",
//           text: "Quel instrument n'est PAS mentionné dans le Psaume 150 ?",
//           options: ["Harpe", "Trompette", "Tambourin", "Orgue"],
//           correctIndex: 3,
//           reference: "Psaume 150:3-5",
//         ),
//         Question(
//           id: "p7",
//           text: "Quel Psaume est cité par Jésus sur la croix ?",
//           options: ["Psaume 22", "Psaume 23", "Psaume 51", "Psaume 100"],
//           correctIndex: 0,
//           reference: "Psaume 22:1",
//         ),
//         Question(
//           id: "p8",
//           text: "Quel Psaume parle du 'rocher qui est plus haut que moi' ?",
//           options: ["Psaume 18", "Psaume 61", "Psaume 91", "Psaume 121"],
//           correctIndex: 1,
//           reference: "Psaume 61:2",
//         ),
//         Question(
//           id: "p9",
//           text: "Quel Psaume contient 7 béatitudes ?",
//           options: ["Psaume 1", "Psaume 119", "Psaume 139", "Psaume 146"],
//           correctIndex: 1,
//           reference: "Psaume 119",
//         ),
//         Question(
//           id: "p10",
//           text: "Quel Psaume commence par 'Bienheureux l'homme...' ?",
//           options: ["Psaume 1", "Psaume 23", "Psaume 100", "Psaume 150"],
//           correctIndex: 0,
//           reference: "Psaume 1:1",
//         ),
//         Question(
//           id: "p11",
//           text: "Quel Psaume parle des 'fleuves de Babylone' ?",
//           options: ["Psaume 42", "Psaume 84", "Psaume 137", "Psaume 150"],
//           correctIndex: 2,
//           reference: "Psaume 137:1",
//         ),
//         Question(
//           id: "p12",
//           text: "Quel Psaume est appelé 'Psaume des degrés' ?",
//           options: ["Psaume 1", "Psaume 23", "Psaume 90", "Psaume 121"],
//           correctIndex: 3,
//           reference: "Psaume 121 (Psaumes 120-134)",
//         ),
//         Question(
//           id: "p13",
//           text: "Quel Psaume parle de Dieu comme 'refuge et forteresse' ?",
//           options: ["Psaume 18", "Psaume 46", "Psaume 91", "Psaume 121"],
//           correctIndex: 1,
//           reference: "Psaume 46:1",
//         ),
//         Question(
//           id: "p14",
//           text:
//               "Quel Psaume contient la phrase 'Ton verbe est une lampe à mes pieds' ?",
//           options: ["Psaume 1", "Psaume 19", "Psaume 119", "Psaume 139"],
//           correctIndex: 2,
//           reference: "Psaume 119:105",
//         ),
//         Question(
//           id: "p15",
//           text: "Quel Psaume est le plus court ?",
//           options: ["Psaume 100", "Psaume 117", "Psaume 131", "Psaume 150"],
//           correctIndex: 1,
//           reference: "Psaume 117 (2 versets)",
//         ),
//       ],
//     ),
//   ];

//   // /**
//   //  * Méthode pour obtenir les catégories mélangées
//   //  * Utile pour varier l'ordre d'affichage
//   //  */
//   static List<Category> get shuffledCategories {
//     final list = List.of(allCategories);
//     list.shuffle();
//     return list;
//   }
// }
