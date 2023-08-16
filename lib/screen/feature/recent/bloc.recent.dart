import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final recentChapterAndSlokChangeNotifier =
    ChangeNotifierProvider<RecentStorageBloc>((ref) => RecentStorageBloc(ref));

class RecentStorageBloc extends ChangeNotifier {
  Ref ref;
  RecentStorageBloc(this.ref);
  final _storage = GetStorage();
  static const _key = 'recent';

  // List<dynamic> get notes {
  //   return _storage.read<List<dynamic>>(_key) ?? [];
  // }
  var recent = {};

  readRecentChapterNote() {
    recent = _storage.read(_key) ?? {};
    notifyListeners();
  }

  void writeRecentChapterNote(
      {required int chapter,
      required int slok,
      required String ht,
      required String et}) {
    var res = {"chapter": chapter, "slok": slok, "ht": ht, "et": et};
    _storage.write(_key, res);
    readRecentChapterNote();
  }

  // void deleteNote(int index) {
  //   List<dynamic> notesList = _storage.read<List<dynamic>>(_key) ?? [];
  //   notesList.removeAt(index);
  //   _storage.write(_key, notesList);
  //   readRecentChapterNote();
  // }
}
