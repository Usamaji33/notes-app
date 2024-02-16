import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/models/theme_database.dart';
import 'package:notes_app/pages/about_page.dart';
import 'package:notes_app/pages/edit_page.dart';
import 'package:notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _textController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    readNotes();
  }

  // Create a new Note
  void createNote() {
    _titleController.clear();
    _textController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPage(
          titleController: _titleController,
          textController: _textController,
          onSave: () {
            if (_titleController.value.text == "") {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  titleTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  title: const Text("Please title it!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Lets do it!"),
                    )
                  ],
                ),
              );
            } else {
              addNote();
            }
          },
        ),
      ),
    );
  }

  // Open Edit Page to update the note
  void update(Note note) {
    _titleController.text = note.title;
    _textController.text = note.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPage(
          titleController: _titleController,
          textController: _textController,
          onSave: () {
            if (_titleController.value.text == "") {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  titleTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  title: const Text("Please title it!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Lets do it!"),
                    )
                  ],
                ),
              );
            } else {
              updateNote(note);
            }
          },
        ),
      ),
    );
  }

  // CREATE
  void addNote() {
    // Add note to database
    context
        .read<NoteDatabase>()
        .addNote(_titleController.value.text, _textController.value.text);

    // Clear text controllers
    _titleController.clear();
    _textController.clear();

    // Close the dialog box
    Navigator.pop(context);
  }

  // READ
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // UPDATE
  void updateNote(Note note) {
    // update the selected note
    context.read<NoteDatabase>().updateNote(
          note.id,
          _titleController.value.text,
          _textController.value.text,
        );

    // clear controllers
    _titleController.clear();
    _textController.clear();

    // pop edit page
    Navigator.pop(context);
  }

  // DELETE
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Switch(
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  inactiveThumbColor: Colors.grey[700],
                  inactiveTrackColor:
                      Theme.of(context).colorScheme.onBackground,
                  value: Provider.of<ThemeDatabase>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                    Provider.of<ThemeDatabase>(context, listen: false)
                        .updateTheme();
                  },
                  thumbIcon: MaterialStatePropertyAll(
                    Icon(
                      Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? Icons.wb_sunny_rounded
                          : Icons.star_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25, top: 25),
            child: Text(
              "Notes",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];

                return GestureDetector(
                  onTap: () {
                    update(note);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
                    decoration: BoxDecoration(
                      color: const Color(0x88888888),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            note.title,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 20,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteNote(note.id);
                          },
                          child: Icon(
                            Icons.delete_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
