import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final themeChangeNotifier =
    ChangeNotifierProvider<ThemeBloc>((ref) => ThemeBloc(ref));

class ThemeBloc extends ChangeNotifier {
  Ref ref;
  ThemeBloc(this.ref);
  static final box = GetStorage();

  darkModetoggle(bool mode) async {
    ref.read(darkModeProvider.notifier).state = mode;
    writeThemeMode(mode);
    notifyListeners();
  }

  readThemeMode() {
    return box.read('darkmode') ?? false;
  }

  //for homepage scrap page
  writeThemeMode(bool darkmode) {
    box.write('darkmode', darkmode);
  }
}

final darkModeProvider = StateProvider<bool>((ref) {
  final box = GetStorage();
  return box.read('darkmode') ?? false;
});
