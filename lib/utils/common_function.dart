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
