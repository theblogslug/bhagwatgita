import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final noteStorageChangeNotifier =
    ChangeNotifierProvider<NotesStorageBloc>((ref) => NotesStorageBloc(ref));

class NotesStorageBloc extends ChangeNotifier {
  Ref ref;
  NotesStorageBloc(this.ref);
  final _storage = GetStorage();
  static const _notesKey = 'notes';

  // List<dynamic> get notes {
  //   return _storage.read<List<dynamic>>(_notesKey) ?? [];
  // }
  List<dynamic> notesList = [];

  readNotes() {
    notesList = _storage.read<List<dynamic>>(_notesKey) ?? [];
    notifyListeners();
  }

  void addNote(dynamic newnote) {
    List<dynamic> note = _storage.read<List<dynamic>>(_notesKey) ?? [];
    note[0] = newnote;
    _storage.write(_notesKey, note);
    readNotes();
  }

  void editNote(int index, dynamic newNote) {
    List<dynamic> note = _storage.read<List<dynamic>>(_notesKey) ?? [];
    // if (index >= 0 && index < notesList.length) {
    note[index] = newNote;
    _storage.write(_notesKey, note);
    readNotes();
    // }
    // ref.watch(notesProvider.notifier).state[index] = newNote;
  }

  void deleteNote(int index) {
    List<dynamic> notesList = _storage.read<List<dynamic>>(_notesKey) ?? [];
    notesList.removeAt(index);
    _storage.write(_notesKey, notesList);
    readNotes();
  }
}
