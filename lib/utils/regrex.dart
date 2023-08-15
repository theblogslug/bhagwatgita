extension DynamicValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  /// regex ref: https://ihateregex.io/expr/phone/
  bool isValidPhoneNumber() =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(this);

  bool isValidName() =>
      RegExp(r'(^[\w\-,.][^0-9_!¡?÷?¿/\\+=@#^$%&*(){}|~<>;:[\]]{2,}$)')
          .hasMatch(this);

  bool isNumber() => RegExp(r'^[0-9]*$').hasMatch(this);
}
