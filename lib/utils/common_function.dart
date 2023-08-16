import 'package:bhadwadgita/screen/feature/bookmark/bloc.bookmark.dart';
import 'package:flutter/material.dart';

camelToSentence(String text) {
  try {
    var result = text.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r" ");
    var finalResult = result[0].toUpperCase() + result.substring(1);
    return finalResult;
  } catch (e) {
    print(e.toString());
  }
}

String whitespaceToUnderscore(String value) {
  return value.replaceAll(' ', '_');
}

String underscoreToWhitespace(String value) {
  return value.replaceAll('_', ' ');
}

chapterContainsPin(ref, {required int chapter}) {
  final pin = ref.watch(bookmarkChangeNotifier).bookmarkList;
  for (var e in pin) {
    if (e.contains('chapter$chapter')) {
      return true;
    }
  }
  return false;
}

returnPinValue(ref, {required int chapter}) {
  final pin = ref.watch(bookmarkChangeNotifier).bookmarkList;
  for (var e in pin) {
    if (e.contains('chapter$chapter')) {
      return e;
    }
  }
  return null;
}

messageAlertBox(context, {required String message}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message),
      );
    },
  );
}

Map<String, int> separateString(String input) {
  Map<String, int> resultMap = {};

  List<String> parts = input.split("-");
  for (String part in parts) {
    String key = part.replaceAll(
        RegExp(r'[0-9]'), ''); // Extract non-digit characters as the key
    int? value = int.tryParse(
        part.replaceAll(RegExp(r'[^0-9]'), '')); // Extract digits as the value

    if (key.isNotEmpty && value != null) {
      resultMap[key] = value;
    }
  }

  return resultMap;
}
