import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final bookmarkChangeNotifier = ChangeNotifierProvider<BookmarkStorageBloc>(
    (ref) => BookmarkStorageBloc(ref));

class BookmarkStorageBloc extends ChangeNotifier {
  Ref ref;
  BookmarkStorageBloc(this.ref);
  final _storage = GetStorage();
  static const _key = 'bookmark';

  List<dynamic> bookmarkList = [];

  readBookmarkrNote() {
    bookmarkList = _storage.read<List<dynamic>>(_key) ?? [];
    log("message storage $bookmarkList");
    notifyListeners();
  }

  void writeBookmarkNote({required int chapter, required int slok}) {
    List<dynamic> temp = _storage.read<List<dynamic>>(_key) ?? [];
    var res = 'chapter$chapter-slok$slok';

    temp.add(res);
    _storage.write(_key, temp);
    readBookmarkrNote();
  }

  void writeBookmarkNoteUpdate({required int chapter, required int slok}) {
    List temp = _storage.read<List<dynamic>>(_key) ?? [];
    temp.removeWhere((e) => e.contains('chapter1'));
    var res = 'chapter$chapter-slok$slok';

    temp.add(res);
    _storage.write(_key, temp);
    readBookmarkrNote();
  }

  void deleteNote(dynamic val) {
    List<dynamic> temp = _storage.read<List<dynamic>>(_key) ?? [];
    temp.removeWhere((e) => e == val);
    _storage.write(_key, temp);
    readBookmarkrNote();
  }
}
