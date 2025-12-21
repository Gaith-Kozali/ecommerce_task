class Validation {
  static String? notEmpty(String? value, {String message = ""}) {
    if (value == null || value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  static String? email(String? value, {String message = ""}) {
    if (value != null &&
        !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(value)) {
      return message;
    } else {
      return null;
    }
  }
}
