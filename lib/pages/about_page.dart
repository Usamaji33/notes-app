import 'package:flutter/material.dart';
import 'package:notes_app/utils/custom_row.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedRotation(
                turns: 0.05,
                duration: Duration.zero,
                child: Icon(
                  Icons.menu_book_rounded,
                  size: 150,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 102, top: 38),
                child: Icon(
                  Icons.edit_rounded,
                  size: 45,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
          Text(
            "Note It!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Monospace",
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 25),
          const CustomRow(
            icon: Icons.code_rounded,
            title: "Developer",
            subtitle: "Usama Mangi",
          ),
          const CustomRow(
            icon: Icons.numbers_rounded,
            title: "Version",
            subtitle: "1.0.0",
          ),
          const CustomRow(
            icon: Icons.edit_note_rounded,
            title: "Note",
            subtitle:
                "This app is built for those who like it simple! Whatever it is that you need to remember, Note it!",
          ),
        ],
      ),
    );
  }
}
