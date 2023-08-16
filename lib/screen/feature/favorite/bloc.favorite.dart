import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final favoriteChangeNotifier = ChangeNotifierProvider<FavoriteStorageBloc>(
    (ref) => FavoriteStorageBloc(ref));

class FavoriteStorageBloc extends ChangeNotifier {
  Ref ref;
  FavoriteStorageBloc(this.ref);
  final _storage = GetStorage();
  static const _key = 'favorite';

  List<dynamic> favoriteList = [];

  readFavoriteListNote() {
    favoriteList = _storage.read<List<dynamic>>(_key) ?? [];
    log("message storage $favoriteList");
    notifyListeners();
  }

  void writeFavoriteNote({required int chapter, required int slok}) {
    List<dynamic> temp = _storage.read<List<dynamic>>(_key) ?? [];
    var res = 'chapter$chapter-slok$slok';

    temp.add(res);
    _storage.write(_key, temp);
    readFavoriteListNote();
  }

  void deleteNote(dynamic val) {
    List<dynamic> temp = _storage.read<List<dynamic>>(_key) ?? [];
    temp.removeWhere((e) => e == val);
    _storage.write(_key, temp);
    readFavoriteListNote();
  }
}
