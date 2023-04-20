import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  List<Note> notes = [];
  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote() {}
  void deleteNote() {}
}
