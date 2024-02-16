import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/theme.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  static late Isar isar;

  // INITIALIZE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema, ThemeDBSchema], directory: dir.path);
  }
}
