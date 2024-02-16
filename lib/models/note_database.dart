import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/isar.dart';
import 'package:notes_app/models/note.dart';

class NoteDatabase extends ChangeNotifier {
  final isar = IsarDatabase.isar;

  // List of Notes
  final List<Note> currentNotes = [];

  // CREATE
  Future<void> addNote(String title, String text) async {
    // create new Note
    final newNote = Note()
      ..title = title
      ..text = text;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-reads notes
    await fetchNotes();
  }

  // READ
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // UPDATE
  Future<void> updateNote(int id, String newTitle, String newText) async {
    final existingNote = await isar.notes.get(id);

    if (existingNote != null) {
      existingNote.title = newTitle;
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
