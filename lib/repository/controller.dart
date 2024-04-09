import 'package:get/get.dart';
import 'package:note_taker/repository/repository.dart';

import '../models/notes_model.dart';

class NotesController extends GetxController {
  final NoteRepository _noteService = NoteRepository();

  var notes = <Note>[].obs;
  var trashNotes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
    fetchTrashNotes();
  }

  void fetchNotes() {
    notes.bindStream(_noteService.getNotes());
  }

  void fetchTrashNotes() {
    trashNotes.bindStream(_noteService.getTrashNotes());
  }

  void addNote(Note note) {
    note.isTrashed = false;
    _noteService.addNote(note);
  }

  void editNote(Note note) {
    _noteService.updateNote(note);
  }

  void deleteNotePermanently(Note note) {
    _noteService.deleteNotePermanently(note);
  }

  void moveNoteToTrash(Note note) {
    note.isTrashed = true;
    _noteService.moveNoteToTrash(note);
  }

  void restoreNoteFromTrash(Note note) {
    note.isTrashed = false;
    _noteService.restoreNoteFromTrash(note);
  }
}
