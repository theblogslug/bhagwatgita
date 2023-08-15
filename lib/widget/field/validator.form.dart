import 'package:bhadwadgita/utils/regrex.dart';

enum FormEnum { email, phoneNumber, name, none, number, date }

String responseIsNum(String apiKey) {
  if (apiKey == 'mobileNumber' || apiKey == 'mobileNo') {
    return FormEnum.phoneNumber.name;
  } else if (apiKey == 'wardNumber' || apiKey == 'wardNo' || apiKey == 'age') {
    return FormEnum.number.name;
  } else if (apiKey == 'email') {
    return FormEnum.email.name;
  } else if (apiKey.contains('Name')) {
    return FormEnum.name.name;
  }
  return FormEnum.none.name;
}

textFieldValidator(
    {required bool isRequired,
    required String val,
    required String hint,
    required String validator}) {
  if (!isRequired) {
    return null;
  }
  if (val == '') {
    return "$hint is Required।";
  }
  if (validator == FormEnum.email.name && !val.isValidEmail()) {
    return "$val मान्य $hint होइन।";
  } else if (validator == FormEnum.phoneNumber.name &&
      !val.isValidPhoneNumber()) {
    return "$val मान्य $hint होइन।";
  } else if (validator == FormEnum.number.name && !val.isNumber()) {
    return "$val मान्य $hint होइन।";
  } else if (validator == FormEnum.name.name && !val.isValidName()) {
    return "$val मान्य $hint होइन।";
  }
  return null;
}
