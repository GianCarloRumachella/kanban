class Validator {
  static String? isEmpty(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }
}
