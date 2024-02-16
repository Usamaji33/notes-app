import 'package:flutter/material.dart';
import 'package:notes_app/models/isar.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/models/theme_database.dart';
import 'package:notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/pages/notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarDatabase.initialize();
  await ThemeDatabase.initialize();
  await ThemeProvider.initialize();

  runApp(
    // Wrap the Main widget with providers to provide data throughout app
    MultiProvider(
      // List of providers
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeDatabase(),
        ),
        ChangeNotifierProvider(
          // For theme data
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotesPage(),

      // set the theme at start of app
      theme: Provider.of<ThemeProvider>(context).themeData,

      // title of the app on web
      title: "Note it!",

      debugShowCheckedModeBanner: false,
    );
  }
}
