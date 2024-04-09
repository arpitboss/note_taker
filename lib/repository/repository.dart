import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/notes_model.dart';

class NoteRepository {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  final CollectionReference trashNotesCollection =
      FirebaseFirestore.instance.collection('trash_notes');

  Future<void> addNote(Note note) async {
    await notesCollection.add(note.toMap());
  }

  Stream<List<Note>> getNotes() {
    return notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  Future<void> updateNote(Note note) async {
    await notesCollection.doc(note.id).update(note.toMap());
  }

  Future<void> deleteNote(Note note) async {
    await notesCollection.doc(note.id).delete();
  }

  Future<void> moveNoteToTrash(Note note) async {
    await trashNotesCollection.add(note.toMap());
    await notesCollection.doc(note.id).delete();
  }

  Stream<List<Note>> getTrashNotes() {
    return trashNotesCollection
        .where('isTrashed', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  Future<void> restoreNoteFromTrash(Note note) async {
    await notesCollection.add({
      'title': note.title,
      'description': note.description,
      'isTrashed': note.isTrashed,
    });
    await trashNotesCollection.doc(note.id).delete();
  }

  Future<void> deleteNotePermanently(Note note) async {
    await notesCollection.doc(note.id).delete();
    await trashNotesCollection.doc(note.id).delete();
  }
}
